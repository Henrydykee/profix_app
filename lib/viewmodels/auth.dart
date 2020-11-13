import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:profixapp/api.dart';
import 'package:profixapp/common/status.dart';
import 'package:profixapp/model/auth_user.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  Status _usersignupstatus;
  Status _userloginstatus;
  Status _getUserDetailsStatus;

  var _api = API();
  SignUpUser _signUpUser;
  String errorMessage = "";
  UserLogin _userLogin;
  String token = " ";

  Status getUserSignupStatus() {
    return _usersignupstatus;
  }

  Status getUserLoginStatus() {
    return _userloginstatus;
  }

  String getToken() {
    return token;
  }

  Status getUserDetailStatus() {
    return _getUserDetailsStatus;
  }

  String getErrorMessage() {
    return errorMessage;
  }

  void clearStatus() {
    _usersignupstatus = null;
    _userloginstatus = null;
    _getUserDetailsStatus = null;
  }

  void SignUpConsumer(SignUpUser signUpUser) async {
    _usersignupstatus = Status.LOADING;
    notifyListeners();
    _api.signupUser(signUpUser).then((response) async {
      log("${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode < 300) {
        _usersignupstatus = Status.SUCCESSFUL;
        notifyListeners();
        _signUpUser = SignUpUser.fromJson(json.decode(response.body)["data"]);
        log("$_signUpUser");
      } else if (response.statusCode == 400 || response.statusCode < 500) {
        _usersignupstatus = Status.FAILED;
        notifyListeners();
        errorMessage = json.decode(response.body)["message"];
        print(response.body);
      }
    }).catchError((onError) {
      _usersignupstatus = Status.FAILED;
      print(onError);
    });
  }

  void LoginConsumer(UserLogin userLogin) async {
    _userloginstatus = Status.LOADING;
    notifyListeners();
    _api.loginUser(userLogin).then((response) async {
      log("${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode < 300) {
        _userloginstatus = Status.SUCCESSFUL;
        notifyListeners();
        token = json.decode(response.body)["token"];
        log("$token");
        // get user details immeditely user logs in
        getUserDetails(token);
      } else if (response.statusCode == 400 || response.statusCode < 500) {
        _userloginstatus = Status.FAILED;
        notifyListeners();
        errorMessage = json.decode(response.body)["message"];
        log("${errorMessage}");
      }
    }).catchError((onError) {
      _userloginstatus = Status.FAILED;
      print(onError);
    });
  }

  void getUserDetails(String token) async {
    _getUserDetailsStatus = Status.LOADING;
    notifyListeners();
    _api.getUserDetails(token).then((response) async {
      log("${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode < 300) {
        _getUserDetailsStatus = Status.SUCCESSFUL;
        notifyListeners();
        var details = json.decode(response.body)["token"];
        log("$details");
      } else if (response.statusCode == 400 || response.statusCode < 500) {
        _getUserDetailsStatus = Status.FAILED;
        notifyListeners();
        errorMessage = json.decode(response.body)["message"];
        log("$errorMessage");
      }
    }).catchError((onError) {
      _getUserDetailsStatus = Status.FAILED;
      print(onError);
    });
  }
}
