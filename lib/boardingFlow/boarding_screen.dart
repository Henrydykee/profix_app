import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profixapp/auth/login_screen.dart';
import 'package:profixapp/auth/sigunp_screen.dart';
import 'package:profixapp/utils/colors.dart';
import 'package:profixapp/widgets/button.dart';
import 'package:profixapp/widgets/slide_dots.dart';
import 'package:profixapp/boardingFlow/slide_list.dart';
import 'package:profixapp/boardingFlow/slider_item.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo_small.png'))),
            ),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: PageView.builder(
                      onPageChanged: _onPageChanged,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => Slideritem(i),
                      itemCount: slideList.length,
                    ),
                    height: 250,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < slideList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: ProfixButton(
              onPrressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              color: Colors.blue,
              title: "SignUp",
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(bottom: 30,left: 25,right: 25),
            child: ProfixButton(
              onPrressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              color: ProfixColor.DARK_BLUE,
              title: "Login",
        ),
          )
        ],
      ),
    );
  }
}
