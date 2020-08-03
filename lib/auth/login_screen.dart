import 'package:flutter/material.dart';
import 'package:profixapp/auth/agent/agent_intro_screen.dart';
import 'package:profixapp/auth/forgotPasscode/reset_password_email_screen.dart';
import 'package:profixapp/auth/sigunp_screen.dart';
import 'package:profixapp/common/status.dart';
import 'package:profixapp/model/auth_user.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/viewmodels/auth.dart';
import 'package:profixapp/widgets/button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthViewModel _authViewModel;
  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child){
          if(viewModel.getUserLoginStatus() == Status.FAILED){
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              viewModel.clearStatus();
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(viewModel.getErrorMessage())),
              );
            });
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/login_background.png"),
                    fit: BoxFit.cover
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                                  controller: _email,
                                  title: "Email",
                                  icon: Icon(Icons.email,color: Colors.white,),
                                ),
                                SizedBox(height: 30,),
                                LoginFields(
                                  controller: _password,
                                  Hide: true,
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
                            status: viewModel.getUserLoginStatus(),
                            onPrressed:() async {
                              if(!_formKey.currentState.validate()){
                                return;
                              } else {
                                final login = UserLogin();
                                login.email = _email.text.trim();
                                login.password = _password.text.trim();
                                await  viewModel.LoginConsumer(login);
                              }
                            },
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
        },
      )
    );
  }
}


