import 'dart:convert' as convert;
import 'dart:convert';

import 'package:example_app/api_parsing/lesson_api_parsing.dart';
import 'package:http/http.dart' as http;

import 'api_parsing/program_api_parsing.dart';

class ProgramApiCall {
  Future<ProgramApiParsing?> getData() async {
    var url =
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = ProgramApiParsing.fromJson(jsonDecode(response.body));
      return decodedData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}

class LessonApiCall {
  Future<LessonApiParsing?> getLessonData() async {
    var url =
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var data1 = LessonApiParsing.fromJson(jsonDecode(response.body));
      return data1;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
