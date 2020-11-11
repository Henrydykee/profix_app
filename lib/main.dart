import 'dart:async';
import 'package:flutter/material.dart';
import 'package:profixapp/boardingFlow/boarding_screen.dart';
import 'package:profixapp/screens/auth/login_screen.dart';
import 'package:profixapp/utils/pref_utils.dart';
import 'package:profixapp/viewmodels/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PrefUtils.getUserHasFinishedOnboarding().then((value){
      if(value != null ){
        Timer(
            Duration(seconds: 3),
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen())));
      } else{
        Timer(
            Duration(seconds: 3),
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => BoardingScreen())));

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_background.png"),
              fit: BoxFit.cover
            )),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
