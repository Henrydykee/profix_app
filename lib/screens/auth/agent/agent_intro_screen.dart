import 'package:flutter/material.dart';
import 'package:profixapp/screens/auth/agent/agent_signup_screen.dart';
import 'package:profixapp/utils/colors.dart';

class AgentIntroScreen extends StatefulWidget {
  @override
  _AgentIntroScreenState createState() => _AgentIntroScreenState();
}

class _AgentIntroScreenState extends State<AgentIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/agent.png"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 25, color: Colors.white)),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Hi\nWelcome to\nProfix Agent.",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                      child: Text(
                        "Here you can\ncreate a profile\nfor your business\non profix",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          fontWeight: FontWeight.w200,

                        ),
                      ),
                    ),
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.only(left: 200,),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AgentSignUpScreen()),
                          );
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: ProfixColor.DARK_BLUE),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: ProfixColor.DARK_BLUE,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgentSignupFields extends StatelessWidget {
  final String title;
  final Icon icon;
  AgentSignupFields({this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: icon),
          hintText: title,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
