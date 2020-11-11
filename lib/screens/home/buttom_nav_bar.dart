import 'package:flutter/material.dart';
import 'package:profixapp/screens/home/home_screen.dart';
import 'package:profixapp/screens/home/profile_screen.dart';

class ButtomNav extends StatefulWidget {
  @override
  _ButtomNavState createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  var screens = [
    HomeScreen(),
    ProfileScreen(),
  ];
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedTab = index;
          });
        },
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          items: [
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("Profile"),
                icon: Icon(Icons.perm_identity)
            ),
            BottomNavigationBarItem(
                title: Text("Settings"),
                icon: Icon(Icons.settings)
            )
          ]
      ),
      body: screens[selectedTab],
    );
  }
}