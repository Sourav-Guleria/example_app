part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocState {}

class LoginBlocInitial extends LoginBlocState {}

class LoginBlocValid extends LoginBlocState{}

class LoginBlocerror extends LoginBlocState{
  final String eroor;
  LoginBlocerror(this.eroor);
}

class LoginBlocLoding extends LoginBlocState{}
