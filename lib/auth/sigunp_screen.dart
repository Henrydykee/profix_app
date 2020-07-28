import 'package:flutter/material.dart';
import 'package:profixapp/model/sigup_user.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/viewmodels/signup.dart';
import 'package:profixapp/widgets/button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SigupViewModel _sigupViewModel;

  @override
  void initState() {
    super.initState();
    _sigupViewModel = Provider.of<SigupViewModel>(context, listen: false);

  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _firstname = TextEditingController();
  var _lastname = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SigupViewModel>(
        builder: (context, viewModel, child){
          return  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_background.png"),
                    fit: BoxFit.cover
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
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
                            SizedBox(height: 40,),
                            Text("SignUp",
                              style: TextStyle(
                                  fontSize: 47,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                              ),),
                            Text("Create a profix account",style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),),
                            SizedBox(height: 30,),
                            LoginFields(
                              controller: _firstname,
                              title: "First Name",
                              icon: Icon(Icons.perm_identity,color: Colors.white,),
                            ),
                            SizedBox(height: 30,),
                            LoginFields(
                              controller: _lastname,
                              title: "Last Name",
                              icon: Icon(Icons.perm_identity,color: Colors.white,),
                            ),
                            SizedBox(height: 30,),
                            LoginFields(
                              controller: _email,
                              title: "Email",
                              icon: Icon(Icons.email,color: Colors.white,),
                            ),
                            SizedBox(height: 30,),
                            LoginFields(
                              controller: _password,
                              title: "Password",
                              icon: Icon(Icons.lock,color: Colors.white,),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      ProfixButton(
                        onPrressed: (){
                          if(!_formKey.currentState.validate()){
                            return;
                          }else{
                            final signup = SignUpUser();
                          }
                        },
                        color: ProfixColor.DARK_BLUE,
                        title: "SignUp",
                      ),
                      SizedBox(height: 10,),
                      Text("Have an account? Login",style: TextStyle(
                          fontSize: 12,
                          color: ProfixColor.DARK_BLUE
                      ),),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}


class LoginFields extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;

  LoginFields({this.title, this.icon,this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white)),
      child: TextFormField(
        controller: controller,
        validator: (value){
          // ignore: missing_return
          if (value.isEmpty){
            return ;
          }
        },
        style: TextStyle(
            color: Colors.white
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