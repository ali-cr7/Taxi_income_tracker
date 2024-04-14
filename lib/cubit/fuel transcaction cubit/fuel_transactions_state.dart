part of 'fuel_transactions_cubit.dart';

@immutable
class FuelTransactionsState {
  final int month;

  const FuelTransactionsState({required this.month});

  FuelTransactionsState copyWith({int? month}) {
    return FuelTransactionsState(month: month ?? this.month);
  }
}
class FuelTransactionsIntial extends FuelTransactionsState {
   FuelTransactionsIntial({required int month}) : super(month: month);
}

class InitialFuelTransactionsState extends FuelTransactionsState {
  InitialFuelTransactionsState({required super.month});
}

class CreateFuelTransactionsDatabaseState extends FuelTransactionsState {
  CreateFuelTransactionsDatabaseState({required super.month});
}

class SuccessInsertToDatabaseState extends FuelTransactionsState {
  SuccessInsertToDatabaseState({required super.month});
}

class SuccessGettingDataFromDatabaseState extends FuelTransactionsState {
  SuccessGettingDataFromDatabaseState({required super.month});
}

class LoadingGetDataFromDatabaseState extends FuelTransactionsState {
  LoadingGetDataFromDatabaseState({required super.month});
}

class DeletingDataFromDatabaseState extends FuelTransactionsState {
  DeletingDataFromDatabaseState({required super.month});
}

class SuccessUpdatingDataFromDatabaseState extends FuelTransactionsState {
  SuccessUpdatingDataFromDatabaseState({required super.month});
}

class ChangeLanguageToEnglishState extends FuelTransactionsState {
  ChangeLanguageToEnglishState({required super.month});
}

class ChangeLanguageToArabicState extends FuelTransactionsState {
  ChangeLanguageToArabicState({required super.month});
}

class ChangeAppModeState extends FuelTransactionsState{
  ChangeAppModeState({required super.month});
}

