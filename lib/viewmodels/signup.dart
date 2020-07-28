import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:profixapp/api.dart';
import 'package:profixapp/common/status.dart';
import 'package:profixapp/model/sigup_user.dart';
import 'package:provider/provider.dart';

class SigupViewModel with  ChangeNotifier {
  Status _status;
  var _api = API();
  SignUpUser _signUpUser;
  String errorMessage = "";

  void SignUpConsumer(SignUpUser signUpUser) async {
    _status = Status.LOADING;
    notifyListeners();
    _api.signupUser(signUpUser).then((response){
      if (response.statusCode == 200){
        _status = Status.SUCCESSFUL;
        _signUpUser = SignUpUser.fromJson(json.decode(response.body));
        log("$_signUpUser");
      }else{
        _status = Status.LOADING;
        notifyListeners();
        errorMessage = json.decode(response.body);
        log("$errorMessage");
      }
    }).catchError((onError){
      log("$errorMessage");
    });
  }




}