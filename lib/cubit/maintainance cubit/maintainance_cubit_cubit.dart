import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taxi_app/models/maintinance_item_model.dart';

part 'maintainance_cubit_state.dart';

class MaintainanceCubitCubit extends Cubit<MaintainanceCubitState> {
  MaintainanceCubitCubit() : super(MaintainanceCubitInitial(month: 0));
  void setSelectedMonth(int month) {
    emit(state.copyWith(month: month));
  }

  static MaintainanceCubitCubit get(context) => BlocProvider.of(context);

  Database? database;
// Future<Database> createDatabase() async {
//   print("initDB executed");
//   String path = join(await getDatabasesPath(), "File.db");
//   await deleteDatabase(path); // Remove this line if you don't want to delete the database on every app start

//   return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
//     await db.execute(tableEmployee);
//     await db.execute(tableAudit);
//     await db.execute(tableProject);
//     await db.execute(tableJobPosition);
//     await db.execute(tableWorkType);
//     await db.execute(tableAssignedJobPosition);
//     await db.execute(tableTimeTrack);
//     await db.execute(tableAllowedWorkType);
//   });
// }
  Future<void> createDatabase() async {
    // path here is the file name
    // db DataBase
    openDatabase('File3.db', version: 1, onCreate: (database, version) {
      // here our database is create (only for the first time)
      // if we don't the path file name
      debugPrint('The database is created');
      database
          .execute('CREATE TABLE maintainances'
              '(id INTEGER PRIMARY KEY, price INTEGER,descrip TEXT, date TEXT)')
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

  List<MaintinanceModel> maintainances = [];

  void getDataFromDatabase(database) {
    emit(LoadingGetDataFromDatabaseState(month: 0));
    maintainances = []; // Initialize the list

    // select everything from your table
    // select * from incomes
    database!.rawQuery('SELECT * FROM maintainances').then((value) {
      for (var row in value) {
        // Assuming your database columns are named 'date' and 'money'
        final DateTime date = DateTime.parse(row['date']);
        final String description = row['descrip'];
        final int price = row['price'];
        final int id = row['id'];
        final maintainanceItem = MaintinanceModel(date: date,describ: description,price: price,id: id);

        // Add it to the incomes list
        maintainances.add(maintainanceItem);
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
    required int price,
    required String description
  }) {
    database!.transaction((txn) async {
      // insert into tableName
      txn
          .rawInsert('INSERT INTO maintainances'
              '( date, price,descrip ) VALUES '
              '( "$date","$price","$description")')
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
    database!
        .rawDelete('DELETE FROM maintainances WHERE id = ? ', [id]).then((value) {
      debugPrint('$value deleted successfully');
      emit(DeletingDataFromDatabaseState(month: 0));
      getDataFromDatabase(database);
    }).catchError((error) {
      debugPrint('an error when deleting data');
    });
  }

   int getSumForMonth(List<MaintinanceModel> incomes, int targetMonth) {
  // Filter incomes for the specified month
  final filteredIncomes = incomes.where((item) => item.date.month == targetMonth);

  // Calculate the sum of money
  final sum = filteredIncomes.fold<int>(0, (prev, curr) => prev + curr.price);

  return sum;
}
}
