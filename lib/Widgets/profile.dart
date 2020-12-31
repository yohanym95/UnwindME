import 'package:flutter/material.dart';

Widget profileAvatar(double width, double height, String url) {
  return GestureDetector(
    child: Container(
      width: width / 4,
      height: width / 4,
      child: url != null
          ? CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(url),
              backgroundColor: Colors.transparent,
            )
          : CircleAvatar(
              radius: 35,
              child: Icon(
                Icons.person,
                color: Colors.purple,
              ),
              backgroundColor: Colors.white,
            ),
    ),
  );
}
