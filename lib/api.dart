import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profixapp/model/sigup_user.dart';
class API{
  static const BASE_URL = "https://profix--api.herokuapp.com/api/v1";

  Future<http.Response> signupUser(SignUpUser signUpUser) async {
    var url = "$BASE_URL/api/Account/Register";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var body = json.encode(signUpUser.toJson());
    return await http.post(url, headers: headers, body: body);
  }
}