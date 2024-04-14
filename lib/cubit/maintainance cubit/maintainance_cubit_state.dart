part of 'maintainance_cubit_cubit.dart';

// @immutable
// sealed class MaintainanceCubitState {}

// final class MaintainanceCubitInitial extends MaintainanceCubitState {}

@immutable
class MaintainanceCubitState {
  final int month;

  const MaintainanceCubitState({required this.month});

  MaintainanceCubitState copyWith({int? month}) {
    return MaintainanceCubitState(month: month ?? this.month);
  }
}

class MaintainanceCubitInitial extends MaintainanceCubitState {
  MaintainanceCubitInitial({required int month}) : super(month: month);
}

class InitialIncomesState extends MaintainanceCubitState {
  InitialIncomesState({required super.month});
}

class CreateIncomesDatabaseState extends MaintainanceCubitState {
  CreateIncomesDatabaseState({required super.month});
}

class SuccessInsertToDatabaseState extends MaintainanceCubitState {
  SuccessInsertToDatabaseState({required super.month});
}

class SuccessGettingDataFromDatabaseState extends MaintainanceCubitState {
  SuccessGettingDataFromDatabaseState({required super.month});
}

class LoadingGetDataFromDatabaseState extends MaintainanceCubitState {
  LoadingGetDataFromDatabaseState({required super.month});
}

class DeletingDataFromDatabaseState extends MaintainanceCubitState {
  DeletingDataFromDatabaseState({required super.month});
}

class SuccessUpdatingDataFromDatabaseState extends MaintainanceCubitState {
  SuccessUpdatingDataFromDatabaseState({required super.month});
}

class ChangeLanguageToEnglishState extends MaintainanceCubitState {
  ChangeLanguageToEnglishState({required super.month});
}

class ChangeLanguageToArabicState extends MaintainanceCubitState {
  ChangeLanguageToArabicState({required super.month});
}

class ChangeAppModeState extends MaintainanceCubitState{
  ChangeAppModeState({required super.month});
}