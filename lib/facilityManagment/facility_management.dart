import 'package:flutter/material.dart';
import 'package:profixapp/utils/colors.dart';

class FacilityManagement extends StatefulWidget {
  @override
  _FacilityManagementState createState() => _FacilityManagementState();
}

class _FacilityManagementState extends State<FacilityManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Facility Management",style: TextStyle(color: ProfixColor.DARK_BLUE),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,)),
      ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mangement_background.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "screens.home",
                      ),
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "screens.home ",
                      ),
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "",
                      ),
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "",
                      ),
                      Items(
                        ImageUrl: "assets/images/cleaning.png",
                        title: "",
                      ),
                    ],
                  )
                ],
              ),
            ) ,
        ));
  }
}

class Items extends StatelessWidget{
  final String  ImageUrl;
  final String title;

  Items({this.ImageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageUrl))
            ),
          ),
          Text(title, style: TextStyle(
            fontSize: 16
          ),)
        ],
      ),
    );
  }

}
