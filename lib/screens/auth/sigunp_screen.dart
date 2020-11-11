import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profixapp/common/status.dart';
import 'package:profixapp/model/auth_user.dart';
import 'package:profixapp/screens/auth/welcome_profix.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/utils/pref_utils.dart';
import 'package:profixapp/viewmodels/auth.dart';
import 'package:profixapp/widgets/button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthViewModel _sigupViewModel;

  @override
  void initState() {
    super.initState();
    _sigupViewModel = Provider.of<AuthViewModel>(context, listen: false);

  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _firstname = TextEditingController();
  var _lastname = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _confrimPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child){
          if (viewModel.getUserSignupStatus() == Status.SUCCESSFUL){
            PrefUtils.setUserHasFinishedOnboarding();
            PrefUtils.setFirstName(_firstname.text);
            PrefUtils.setLastName(_lastname.text);
            PrefUtils.setPhoneNumber(_phoneNumber.text);
            PrefUtils.setGender("Male");
            WidgetsBinding.instance.addPostFrameCallback((_) {
             viewModel.clearStatus();
             Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(builder: (context) {
                 return WelcomeProfix(
                   name: _firstname.text.toUpperCase(),
                 );
               }),
                   (_) => false,
             );
            });
          }
          else if(viewModel.getUserSignupStatus() == Status.FAILED){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              viewModel.clearStatus();
              print("error message ${viewModel.getErrorMessage()}");
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(viewModel.getErrorMessage())),
              );
            });
          }
          return  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/signup_background.png"),
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
                                  viewModel.clearStatus();
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
                            SizedBox(height: 15,),
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
                              controller: _phoneNumber,
                              title: "Phone Number",
                              icon: Icon(Icons.phone,color: Colors.white,),
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                            ),
                            SizedBox(height: 30,),
                            LoginFields(
                              controller: _password,
                              title: "Password",
                              Hide: true,
                              icon: Icon(Icons.lock,color: Colors.white,),
                            ),
                            SizedBox(height: 30,),
//                            LoginFields(
//                              controller: _confrimPassword,
//                              title: "Confirm Password",
//                              Hide: true,
//                              icon: Icon(Icons.lock,color: Colors.white,),
//                            ),
//                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      ProfixButton(
                        status: viewModel.getUserSignupStatus(),
                        onPrressed: () async {
                          if(!_formKey.currentState.validate()){
                            return"";
                          }else{
                            final signup = SignUpUser();
                            signup.firstName = _firstname.text.trim();
                            signup.lastName =_lastname.text.trim();
                            signup.email = _email.text.trim();
                            signup.password = _password.text.trim();
                            signup.phoneNumber = _phoneNumber.text.trim();
                            signup.gender = "male";
                            viewModel.SignUpConsumer(signup);
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
                      SizedBox(height: 30,)
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
  final List<TextInputFormatter> inputFormatters;
  final bool Hide;

  LoginFields({this.title, this.icon,this.controller,this.inputFormatters,this.Hide});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white)),
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        validator: (value){
          if (value.isEmpty){
          return '';
          }
        },
        obscureText: Hide == null? false : Hide,
        inputFormatters: inputFormatters,
        style: TextStyle(
            color: Colors.white
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 0,
            height: 0
          ),
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