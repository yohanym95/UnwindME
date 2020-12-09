import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Widgets/profile.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        backgroundColor: Color(0xFF9d59b8),
        title: Text('Profile',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(5, 15, 5, 8),
                alignment: Alignment.topCenter,
                child: profileAvatar(width, height)),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: getText('Uresha Jayamali', 25, FontWeight.w700),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: getText('ureshaj@gmail.com', 20, FontWeight.w500),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getText('123.0 cm', 18, FontWeight.w500),
                    SizedBox(
                      width: 10,
                    ),
                    getText('34.0 kg', 18, FontWeight.w500)
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: getText('Female', 18, FontWeight.w500),
              ),
            ),
            Image.asset('assets/logos/logotrans.png', height: 100, width: 100),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
                child: getText('Level 7', 18, FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new LinearPercentIndicator(
                width: width - 20,
                lineHeight: 8.0,
                percent: 0.5,
                progressColor: Colors.purple,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                      child: getText('Bronze Badge', 23, FontWeight.w800),
                    ),
                  ),
                  Image.asset('assets/logos/badge1.png', height: 50, width: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getText(String text, double fontSize, FontWeight fontWeight) {
    return Container(
        child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Color(0xFF251756),
      ),
    ));
  }
}
