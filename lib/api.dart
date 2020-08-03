import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:profixapp/model/auth_user.dart';
class API{
  static const BASE_URL = "https://profix--api.herokuapp.com/api/v1";

  Future<http.Response> signupUser(SignUpUser signUpUser) async {
    var url = "$BASE_URL/users/";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var body = json.encode(signUpUser.toJson());
    return await http.post(url, headers: headers, body: body);
  }

  Future<http.Response> loginUser(UserLogin userLogin) async {
    var url = "$BASE_URL/users/login";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var body = json.encode(userLogin.toJson());
    log("$body");
    return await http.post(url, headers: headers, body: body);
  }

}