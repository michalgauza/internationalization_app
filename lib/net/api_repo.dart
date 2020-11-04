import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_response.dart';

class ApiRepo {
  Future<ApiResponse> fetchQuote() async {
    var response = await http
        .get("https://programming-quotes-api.herokuapp.com/quotes/random");
    return ApiResponse.fromJson(jsonDecode(response.body));
  }
}
