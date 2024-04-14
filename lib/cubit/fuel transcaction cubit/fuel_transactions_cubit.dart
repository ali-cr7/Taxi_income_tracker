import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taxi_app/models/fules_transaction_model.dart';

part 'fuel_transactions_state.dart';

class FuelTransactionsCubit extends Cubit<FuelTransactionsState> {
  FuelTransactionsCubit() : super(FuelTransactionsState(month: 0));

  void setSelectedMonth(int month) {
    emit(state.copyWith(month: month));
  }

  static FuelTransactionsCubit get(context) => BlocProvider.of(context);

  Database? database;

  Future<void> createDatabase() async {
    // path here is the file name
    // db DataBase
    openDatabase('File1.db', version: 1, onCreate: (database, version) {
      // here our database is create (only for the first time)
      // if we don't the path file name
      debugPrint('The database is created');
      database
          .execute('CREATE TABLE fuelTransactions'
              '(id INTEGER PRIMARY KEY, price INTEGER, amount INTEGER, date TEXT)')
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
      emit(CreateFuelTransactionsDatabaseState(month: 0));
    }).catchError((error) {
      debugPrint('errro when opening the file');
    });
  }

  List<FuelTransactionModel> fuelTransactions = [];

  void getDataFromDatabase(database) {
    emit(LoadingGetDataFromDatabaseState(month: 0));
    fuelTransactions = []; // Initialize the list

    // select everything from your table
    // select * from incomes
    database!.rawQuery('SELECT * FROM fuelTransactions').then((value) {
      for (var row in value) {
        // Assuming your database columns are named 'date' and 'money'
        final DateTime date = DateTime.parse(row['date']);
        final int price = row['price'];
        final int amount = row['amount'];
        final int id = row['id'];
        final fuelTransactionItem = FuelTransactionModel(
            amount: amount, date: date, price: price, id: id);

        // Add it to the incomes list
        fuelTransactions.add(fuelTransactionItem);
        // print(incomes.length);
      }

      emit(SuccessGettingDataFromDatabaseState(month: 0));
      debugPrint('$value');
    }).catchError((error) {
      debugPrint('error when getting data from database');
    });
  }

  // insert to database
  void insertToDatabase(
      {required String date, required int price, required int amount}) {
    database!.transaction((txn) async {
      // insert into tableName
      txn
          .rawInsert('INSERT INTO fuelTransactions'
              '( date, price, amount) VALUES '
              '( "$date","$price", "$amount")')
          .then((value) {
        debugPrint('$value is inserted successfully');
        getDataFromDatabase(database);
        emit(SuccessInsertToDatabaseState(month: 0));
      }).catchError((error) {
        debugPrint('an error when inserting into database');
      });
    });
  }

// how to delete data from database

  void deleteDataFromDatabase({required int id}) {
    database!.rawDelete(
        'DELETE FROM fuelTransactions WHERE id = ? ', [id]).then((value) {
      debugPrint('$value deleted successfully');
      emit(DeletingDataFromDatabaseState(month: 0));
      getDataFromDatabase(database);
    }).catchError((error) {
      debugPrint('an error when deleting data');
    });
  }
 int getSumForMonth(List<FuelTransactionModel> incomes, int targetMonth) {
  // Filter incomes for the specified month
  final filteredIncomes = incomes.where((item) => item.date.month == targetMonth);

  // Calculate the sum of money
  final sum = filteredIncomes.fold<int>(0, (prev, curr) => prev + curr.price);

  return sum;
}

}

