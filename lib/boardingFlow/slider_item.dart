import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profixapp/boardingFlow/slide_list.dart';


class Slideritem extends StatelessWidget {

  final int index;
  Slideritem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(slideList[index].imageUrl),
                    fit: BoxFit.contain,)),
            ),
          ],
        ),
//        SizedBox(height: 15,),
//        Text(slideList[index].title,style: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 16,
//            color: Colors.white
//        ),),
//        Padding(
//          padding: EdgeInsets.only(top: 10.0,left: 53, right: 53),
//          child: Text(slideList[index].description,
//            textAlign: TextAlign.center,
//            style: TextStyle(
//                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//          ),
//        )
      ],
    );
  }
}
