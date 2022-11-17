import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<LoginTextChangeEvent>((event, emit) {
      print(event.password.length);
      if (event.email == "" || EmailValidator.validate(event.email) == false) {
        emit(LoginBlocerror("Please Enter Valid Email"));
      } else if (event.password.length < 7) {
        emit(LoginBlocerror("Pleas Enter Valid password"));
      }else {
        emit(LoginBlocValid());
      }
    });
    on<LoginSubmitEvent>((event, emit) {
      print("sourav+++++");
      emit(LoginBlocLoding());
    });
  }
}
