import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profixapp/common/status.dart';

class ProfixButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPrressed;
  final Status status;
  final bool isDisabled;

  ProfixButton({this.color,this.title,this.onPrressed,this.status,this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!isDisabled){
          onPrressed();
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: status != null && status == Status.LOADING? Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.0,
                )) :
            Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
