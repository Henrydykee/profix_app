import 'package:flutter/material.dart';
import 'package:profixapp/facilityManagment/facility_management.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/utils/pref_utils.dart';
import 'package:profixapp/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = "";
  String lastName = "";

  @override
  void initState() {
    PrefUtils.getFirstName().then((value){
      setState(() {
        firstName = value;
      });
    });
    PrefUtils.getLastName().then((value){
      setState(() {
        lastName = value;
      });
    });
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 70.0,
                backgroundColor: ProfixColor.DARK_BLUE,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                  maxRadius: 65.0,
                ),
              ),
              SizedBox(height: 20,),
              Text("$firstName $lastName",style: TextStyle(
                fontSize: 23,
                color: ProfixColor.DARK_BLUE,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Container(
                  height: 23,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ProfixColor.DARK_BLUE,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  children: [
                    Icon(Icons.credit_card,color: ProfixColor.DARK_BLUE,size: 25,),
                    SizedBox(width: 10,),
                    Text("Add Card",style: TextStyle(
                      fontSize: 13,
                      color: ProfixColor.DARK_BLUE
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  children: [
                    Icon(Icons.security,color: ProfixColor.DARK_BLUE,size: 25,),
                    SizedBox(width: 10,),
                    Text("Security Settings",style: TextStyle(
                        fontSize: 13,
                        color: ProfixColor.DARK_BLUE
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              ////////////////////
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  children: [
                    Icon(Icons.change_history,color: ProfixColor.DARK_BLUE,size: 25,),
                    SizedBox(width: 10,),
                    Text("Transaction History",style: TextStyle(
                        fontSize: 13,
                        color: ProfixColor.DARK_BLUE
                    ),),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              color: ProfixColor.LIGHT_BLUE,

            ),
            Stack(
              children: [

                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/home_header.png",
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 25, top: 25),
                 child: GestureDetector(
                   onTap: (){
                     _scaffoldKey.currentState.openDrawer();
                   },
                   child: Icon(
                     Icons.menu,
                     color: Colors.white,
                     size: 25,
                   ),
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      ///LOGO
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Container(
                              height: 45,
                              width: 45,
                              child: Image.asset(
                                "assets/images/logo.png",
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ///WALLET AREA
                      Container(
                        // height: 136,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18.0),
                              topLeft: Radius.circular(18.0),
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
                                      color: ProfixColor.DARK_BLUE,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 5),
                                    child: Text(
                                      "Balance: 100,000",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                height: 20,
                                color: Colors.black,
                              ),
                              Container(
                                height: 23,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: ProfixColor.DARK_BLUE,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Fund",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    QuickButton(
                      image:"assets/images/facility_mgt.png" ,
                      title: "Facility Mgnt",
                      ontap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FacilityManagement()),
                        );
                      },
                    ),
                    SizedBox(width: 10,),
                    QuickButton(
                      image:"assets/images/auto_mobile.png" ,
                      title: "Auto Mobile",
                      ontap: (){},
                    ),
                    SizedBox(width: 10,),
                    QuickButton(
                      image:"assets/images/rental.png" ,
                      title: "Rental Services",
                      ontap: (){},
                    ),
                    SizedBox(width: 10,),
                    QuickButton(
                      image:"assets/images/logistics.png" ,
                      title: "Logistics",
                      ontap: (){},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 116,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ProfixColor.DARK_BLUE,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage("assets/images/market.jpg")),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text("MARKET PLACE",style: TextStyle(
                    fontSize: 25,
                    color: ProfixColor.DARK_BLUE,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: <Widget>[
                    Container(
                      height: 163,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/tools.jpg"))
                      ),
                    ),
                    Container(
                      height: 163,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/market.jpg"))
                      ),
                    ),    Container(
                      height: 163,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/tools.jpg"))
                      ),
                    ),   Container(
                      height: 163,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage("assets/images/market.jpg"))
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuickButton extends StatelessWidget {
  final String image;
  final Function ontap;
  final String title;

  QuickButton({this.image, this.ontap,this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                  width: 80,
                  child: Image.asset(image)),
              Text("$title",style: TextStyle(
                fontSize: 10,
                color: ProfixColor.DARK_BLUE
              ),)
            ],
          ),
        ));
  }
}
