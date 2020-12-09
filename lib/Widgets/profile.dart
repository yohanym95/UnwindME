import 'package:flutter/material.dart';

Widget profileAvatar(double width, double height) {
  return GestureDetector(
    child: Container(
      width: width / 4,
      height: width / 4,
      child: CircleAvatar(
        // backgroundColor: Colors.white,
        // child: Image(
        //   image: AssetImage("assets/logos/girl.jpg"),
        //   height: 100,
        //   width: 100,
        // ),
        backgroundImage: AssetImage("assets/logos/girl.jpg")
      ),
    ),
    onTap: () {
      // askCapture(context);
    },
  );
}
