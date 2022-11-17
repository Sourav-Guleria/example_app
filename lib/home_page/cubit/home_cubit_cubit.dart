import 'package:bloc/bloc.dart';
import 'package:example_app/api_call.dart';
import 'package:example_app/api_parsing/lesson_api_parsing.dart';
import 'package:example_app/api_parsing/program_api_parsing.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  void fetchData() async {
    emit(HomeCubitLoding());
    var data = await ProgramApiCall().getData();
    var data1 = await LessonApiCall().getLessonData();
   
    print(data.toString() + "---->sourav");
    if (data != null) {
      emit(HomeCubitLoaded(data, data1, await getStringValuesSF()));
    } else {
      emit(HomeCubitFailed("Something Went Wrong"));
    }
  }
   Future<String> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('name');
    return stringValue!;
  }
  
}
