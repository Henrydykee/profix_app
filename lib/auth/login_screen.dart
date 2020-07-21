import 'package:flutter/material.dart';
import 'package:profixapp/auth/agent/agent_intro_screen.dart';
import 'package:profixapp/auth/forgotPasscode/reset_password_email_screen.dart';
import 'package:profixapp/auth/sigunp_screen.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_background.png"),
                fit: BoxFit.cover
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
                          SizedBox(height: 100,),
                          Text("Login",style: TextStyle(
                              fontSize: 47,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                          ),),
                          Text("Login to your profix account",style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          ),),
                          SizedBox(height: 30,),
                          LoginFields(
                            title: "Email",
                            icon: Icon(Icons.email,color: Colors.white,),
                          ),
                          SizedBox(height: 30,),
                          LoginFields(
                            title: "Password",
                            icon: Icon(Icons.lock,color: Colors.white,),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPasswordEmailScreen()),
                            );
                          },
                          child: Text("Forgot Password?",
                            style: TextStyle(
                                fontSize: 12,
                                color: ProfixColor.DARK_BLUE
                            ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ProfixButton(
                      color: ProfixColor.DARK_BLUE,
                      title: "Login",
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text("Don't have an account? SignUp",style: TextStyle(
                      fontSize: 12,
                      color: ProfixColor.DARK_BLUE
                  ),),
                ),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.only(left: 100,right: 100),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AgentIntroScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ProfixColor.DARK_BLUE),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Agent SignUp",
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
        ),
      ),
    );
  }
}


