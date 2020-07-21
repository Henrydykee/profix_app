import 'package:flutter/material.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/widgets/button.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                      "Enter Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ProfixColor.DARK_BLUE,
                          fontSize: 14
                      ),),
                    SizedBox(height: 10,),
                    ResetPasswordFields(
                      title: "Enter Password",
                    ),
                    SizedBox(height: 10,),
                    ResetPasswordFields(
                      title: "Confrim Password",
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
