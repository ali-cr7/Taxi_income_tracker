import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taxi_app/models/income_model.dart';

part 'incomes_state.dart';

class IncomesCubit extends Cubit<IncomesState> {
  IncomesCubit() : super(IncomesState(month: 0));
  void setSelectedMonth(int month) {
    emit(state.copyWith(month: month));
  }

  static IncomesCubit get(context) => BlocProvider.of(context);

  Database? database;
  Future<void> createDatabase() async {
    // path here is the file name
    // db DataBase
    openDatabase('File.db', version: 1, onCreate: (database, version) {
      // here our database is create (only for the first time)
      // if we don't the path file name
      debugPrint('The database is created');
      database
          .execute('CREATE TABLE incomes'
              '(id INTEGER PRIMARY KEY, money INTEGER, date TEXT)')
          .then((value) {
        // here the table is created
        debugPrint('our table is created');
      }).catchError((error) {
        // here is an error when creating our table
        debugPrint('an error when creating the table');
      });
    }, onOpen: (database) {
      debugPrint('database file is opened');
      getDataFromDatabase(database);
    }).then((value) {
      // the database file is succeed to open
      database = value;
      emit(CreateIncomesDatabaseState(month: 0));
    }).catchError((error) {
      debugPrint('errro when opening the file');
    });
  }

  List<IncomeItemModel> incomes = [];

  void getDataFromDatabase(database) {
    emit(LoadingGetDataFromDatabaseState(month: 0));
    incomes = []; // Initialize the list

    // select everything from your table
    // select * from incomes
    database!.rawQuery('SELECT * FROM incomes').then((value) {
      for (var row in value) {
        // Assuming your database columns are named 'date' and 'money'
        final DateTime date = DateTime.parse(row['date']);
        final int money = row['money'];
        final int id = row['id'];
        final incomeItem = IncomeItemModel(date: date, money: money,id: id);

        // Add it to the incomes list
        incomes.add(incomeItem);
        // print(incomes.length);
      }
      emit(SuccessGettingDataFromDatabaseState(month: 0));
      debugPrint('$value');
    }).catchError((error) {
      debugPrint('error when getting data from database');
    });
  }
  // insert to database
  void insertToDatabase({
    required String date,
    required int money,
  }) {
    database!.transaction((txn) async {
      // insert into tableName
      txn
          .rawInsert('INSERT INTO incomes'
              '( date, money) VALUES '
              '( "$date","$money")')
          .then((value) {
        debugPrint('$value is inserted successfully');
        getDataFromDatabase(database);
        emit(SuccessInsertToDatabaseState(month: 0));
      }).catchError((error) {
        debugPrint('an error when inserting into database');
      });
    });
  }

  int getSumForMonth(List<IncomeItemModel> incomes, int targetMonth) {
  // Filter incomes for the specified month
  final filteredIncomes = incomes.where((item) => item.date.month == targetMonth);

  // Calculate the sum of money
  final sum = filteredIncomes.fold<int>(0, (prev, curr) => prev + curr.money);

  return sum;
}

// Usage example
// final specificMonth = 5; // Replace with the desired month (1 for January, 2 for February, etc.)
// final totalMoneyForMonth = getSumForMonth(incomes, specificMonth);
// print('Total money for month $specificMonth: \$$totalMoneyForMonth');

// how to delete data from database

  void deleteDataFromDatabase({required int id}) {
    database!
        .rawDelete('DELETE FROM incomes WHERE id = ? ', [id]).then((value) {
      debugPrint('$value deleted successfully');
      emit(DeletingDataFromDatabaseState(month: 0));
      getDataFromDatabase(database);
    }).catchError((error) {
      debugPrint('an error when deleting data');
    });
  }
}
