import 'package:flutter/material.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/widgets/button.dart';

class AgentSignUpScreen extends StatefulWidget {
  @override
  _AgentSignUpScreenState createState() => _AgentSignUpScreenState();
}

class _AgentSignUpScreenState extends State<AgentSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/agent2.png"),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 50,bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 25, color: Colors.black)),
                    Expanded(
                      child: Center(
                        child: Text("SignUp",style: TextStyle(
                          fontSize: 20,
                          color: ProfixColor.DARK_BLUE,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25),
                AgentSignupFields(
                  title: "Business Name",
                  icon: Icon(Icons.perm_identity,color: Colors.white,),
                ),
                SizedBox(height: 25),
                AgentSignupFields(
                  title: "Business Email",
                  icon: Icon(Icons.mail,color: Colors.white,),
                ),
                SizedBox(height: 25),
                AgentSignupFields(
                  title: "Business Catergory",
                 // icon: Icon(Icons.mail,color: Colors.white,),
                ),
                SizedBox(height: 25),
                AgentSignupFields(
                  title: "Password",
                  icon: Icon(Icons.lock,color: Colors.white,),
                ),
                SizedBox(height: 25),
                AgentSignupFields(
                  title: "Confirm Password",
                  icon: Icon(Icons.lock,color: Colors.white,),
                ),
                SizedBox(height: 100),
                ProfixButton(
                  color: ProfixColor.DARK_BLUE,
                  title: "Sign Up",
                ),
                SizedBox(height: 20),
                Center(
                  child: Text("Already have an account? Login",style: TextStyle(
                    color: ProfixColor.DARK_BLUE,
                    fontWeight: FontWeight.w200,
                    fontSize: 14
                  ),),
                )
              ],
            ),
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
          color: Colors.blue.withOpacity(0.7),
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
