import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ProgramApiCall {
  void getData() async {
    var url =
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    http.Response response = await http.get(url);
    {
      if (response.statusCode == 200) {
        print(response.body);
         print("From diffrent class");
        String data = response.body;
        var decodedData = convert.jsonDecode(data);
        return decodedData;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
}
