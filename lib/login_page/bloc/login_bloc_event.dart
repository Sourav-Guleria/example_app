part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocEvent {}

class LoginTextChangeEvent extends LoginBlocEvent{
  String email;
  String password;
  LoginTextChangeEvent(this.email,this.password);
}

class LoginSubmitEvent extends LoginBlocEvent{
  String email;
  String password;
  LoginSubmitEvent(this.email,this.password);
}
