part of 'incomes_cubit.dart';

@immutable
class IncomesState {
  final int month;

  const IncomesState({required this.month});

  IncomesState copyWith({int? month}) {
    return IncomesState(month: month ?? this.month);
  }
}
class IncomeIntial extends IncomesState {
   IncomeIntial({required int month}) : super(month: month);
}

class InitialIncomesState extends IncomesState {
  InitialIncomesState({required super.month});
}

class CreateIncomesDatabaseState extends IncomesState {
  CreateIncomesDatabaseState({required super.month});
}

class SuccessInsertToDatabaseState extends IncomesState {
  SuccessInsertToDatabaseState({required super.month});
}

class SuccessGettingDataFromDatabaseState extends IncomesState {
  SuccessGettingDataFromDatabaseState({required super.month});
}

class LoadingGetDataFromDatabaseState extends IncomesState {
  LoadingGetDataFromDatabaseState({required super.month});
}

class DeletingDataFromDatabaseState extends IncomesState {
  DeletingDataFromDatabaseState({required super.month});
}

class SuccessUpdatingDataFromDatabaseState extends IncomesState {
  SuccessUpdatingDataFromDatabaseState({required super.month});
}

class ChangeLanguageToEnglishState extends IncomesState {
  ChangeLanguageToEnglishState({required super.month});
}

class ChangeLanguageToArabicState extends IncomesState {
  ChangeLanguageToArabicState({required super.month});
}

class ChangeAppModeState extends IncomesState{
  ChangeAppModeState({required super.month});
}