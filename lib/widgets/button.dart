import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfixButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPrressed;

  ProfixButton({this.color,this.title,this.onPrressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPrressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
