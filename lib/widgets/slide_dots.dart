import 'package:flutter/material.dart';
import 'package:profixapp/utils/colors.dart';
// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: isActive? 8: 8,
      width:  isActive? 8: 8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue) ,
          color: isActive ? ProfixColor.DARK_BLUE : Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}
