import 'package:flutter/material.dart';
import 'package:profixapp/screens/auth/forgotPasscode/reset_password_otp_screen.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/widgets/button.dart';

class ResetPasswordEmailScreen extends StatefulWidget {
  @override
  _ResetPasswordEmailScreenState createState() => _ResetPasswordEmailScreenState();
}

class _ResetPasswordEmailScreenState extends State<ResetPasswordEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back_ios,size: 25,color: ProfixColor.DARK_BLUE,)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
                child: Column(
                  children: [
                    Text(
                      "Enter your email and will send you instructions on how to reset it",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ProfixColor.DARK_BLUE,
                          fontSize: 14
                      ),),
                    SizedBox(height: 10,),
                    ResetPasswordFields(
                      title: "Email",
                      icon: Icon(Icons.email,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,bottom: 30),
            child: ProfixButton(
              color: ProfixColor.DARK_BLUE,
              title: "Proceed",
              onPrressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPasswordOTPScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResetPasswordFields extends StatelessWidget {
  final String title;
  final Icon icon;
  ResetPasswordFields({this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white)),
      child: TextField(
        style: TextStyle(
            color: Colors.black
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: icon
          ),
          hintText: title,
          hintStyle: TextStyle(
              color: Colors.white
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
