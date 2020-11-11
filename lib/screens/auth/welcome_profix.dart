import 'package:flutter/material.dart';
import 'package:profixapp/screens/home/buttom_nav_bar.dart';
import 'package:profixapp/utils/colors.dart';

class WelcomeProfix extends StatefulWidget {
  String name;

  WelcomeProfix({this.name});

  @override
  _WelcomeProfixState createState() => _WelcomeProfixState();
}

class _WelcomeProfixState extends State<WelcomeProfix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome.png"),
                fit: BoxFit.cover
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Text("Hi ${widget.name},\nWelcome to",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Profix",style: TextStyle(
                          color: ProfixColor.DARK_BLUE,
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 200 ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ButtomNav();
                            }),
                                (_) => false,
                          );
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: ProfixColor.DARK_BLUE),
                            borderRadius: BorderRadius.circular(20),
                            color:ProfixColor.DARK_BLUE,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                 color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
