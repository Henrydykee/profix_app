import 'package:flutter/material.dart';
import 'package:profixapp/screens/home/home_screen.dart';
import 'package:profixapp/screens/home/profile_screen.dart';
import 'package:profixapp/screens/home/setting_screen.dart';
import 'package:profixapp/utils/colors.dart';

class ButtomNav extends StatefulWidget {
  @override
  _ButtomNavState createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  var screens = [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index){
          setState(() {
            selectedTab = index;
          });
        },
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          items: [
            BottomNavigationBarItem(
              title: Text("Home",style: TextStyle(color: selectedTab == 0 ? ProfixColor.DARK_BLUE : Colors.grey ),),
              icon: Icon(Icons.home,color: selectedTab == 0 ? ProfixColor.DARK_BLUE : Colors.grey,)
            ),
            BottomNavigationBarItem(
                title:Text("Profile", style: TextStyle(color: selectedTab == 1 ? ProfixColor.DARK_BLUE : Colors.grey ) ),
                icon: Icon(Icons.perm_identity, color: selectedTab == 1  ? ProfixColor.DARK_BLUE : Colors.grey,)
            ),
            BottomNavigationBarItem(
                title: Text("Settings",style: TextStyle(color: selectedTab == 2 ? ProfixColor.DARK_BLUE : Colors.grey )),
                icon: Icon(Icons.settings, color: selectedTab == 2 ? ProfixColor.DARK_BLUE : Colors.grey,)
            )
          ]
      ),
      body: screens[selectedTab],
    );
  }
}
