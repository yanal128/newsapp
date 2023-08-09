import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiServices {
  dynamic fetchData(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var data = json.decode(response.body);
            return data;

        }
      case 400:
        return print("Error");
      case 500:
        return print("Error");
      default:
        return print("Error");
    }
  }
}
