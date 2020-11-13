import 'package:flutter/material.dart';
import 'package:profixapp/common/status.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/viewmodels/auth.dart';
import 'package:profixapp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  var _gender = TextEditingController();
  String token = "";


  AuthViewModel authViewModel;



  @override
  Future<void> initState() {
    token =  authViewModel.getToken();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authViewModel.getUserDetails(token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthViewModel>(
          builder: (context,  viewModel, child){
            if(viewModel.getUserDetailStatus() == Status.LOADING){

            } else if (viewModel.getUserDetailStatus() ==  Status.FAILED){

            } else if (viewModel.getUserDetailStatus() == Status.SUCCESSFUL){

            }
            return  Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/mangement_background.png"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        // height: 136,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: ProfixColor.DARK_BLUE,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0)
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 25),
                                    child: Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 25, left: 5),
                                    child: Text(
                                      "Balance: 100,000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                height: 20,
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/customer_service.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0,right: 6.0,top: 2,bottom: 2),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add_alert,color: Colors.red,),
                                            Text(
                                              "Report Scam",
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 11),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      CustomTextField(
                          label: "Name",
                          labelTextColor: ProfixColor.DARK_BLUE,
                          readOnly: true),
                      SizedBox(height: 10),
                      CustomTextField(
                          label: "Gender",
                          labelTextColor: ProfixColor.DARK_BLUE,
                          readOnly: true),
                      SizedBox(height: 10),
                      CustomTextField(
                          label: "Email",
                          labelTextColor: ProfixColor.DARK_BLUE,
                          readOnly: true),
                      SizedBox(height: 10),
                      CustomTextField(
                          label: "Phone Number",
                          labelTextColor: ProfixColor.DARK_BLUE,
                          readOnly: true)
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
