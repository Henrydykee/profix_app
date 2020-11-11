import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';


class PrefUtils{
  static const _FIRST_NAME = "firstName";
  static const _LAST_NAME = "lastName";
  static const _EMAIL_ADDRESS = "emailAddress";
  static const _GENDER = "gender";
  static const _PHONE_NUMBER = "phoneNumber";
  static const _USER_FINISHED_ONBOARDING = "user_finished_onboarding";

  static setFirstName(String firstName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_FIRST_NAME, firstName);
  }

  static Future<String> getFirstName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_FIRST_NAME);
  }

  static setLastName(String lastName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_LAST_NAME, lastName);
  }

  static Future<String> getLastName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_LAST_NAME);
  }

  static setEmail(String emailAddress) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_EMAIL_ADDRESS, emailAddress);
  }

  static Future<String> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_EMAIL_ADDRESS);
  }

  static setGender(String gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_GENDER, gender);
  }

  static Future<String> getGender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_GENDER);
  }

  static setPhoneNumber(String phoneNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_PHONE_NUMBER, phoneNumber);
  }

  static Future<String> getPhoneNumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_PHONE_NUMBER);
  }



  static setUserHasFinishedOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_USER_FINISHED_ONBOARDING, true);
  }

  static Future<bool> getUserHasFinishedOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_USER_FINISHED_ONBOARDING);
  }

}