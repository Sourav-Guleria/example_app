part of 'home_cubit_cubit.dart';

@immutable
abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitLoding extends HomeCubitState {}

class HomeCubitLoaded extends HomeCubitState {
  ProgramApiParsing? data;
  LessonApiParsing? data1;
  String uName;

  HomeCubitLoaded(this.data, this.data1,this.uName);
}

class HomeCubitFailed extends HomeCubitState {
  String message;

  HomeCubitFailed(this.message);
}
