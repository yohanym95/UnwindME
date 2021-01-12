import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Views/Environments.dart';
import 'package:flutter_maaapp/Views/History.dart';
import 'package:flutter_maaapp/Views/Feedback.dart';
import 'package:flutter_maaapp/Views/Profile.dart';
import 'package:flutter_maaapp/Views/Questionarie.dart';
import 'package:flutter_maaapp/Views/modes.dart';
import 'package:flutter_maaapp/Widgets/profile.dart';
import 'package:flutter_maaapp/services/ProfileRepository.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF9d59b8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage("assets/logos/logotrans.png"),
              width: 60,
              height: 60,
            ),
            Text(
              'UNWINDME',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
                child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Current Status',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color(0xFF251756)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 10.0,
                      percent: 0.4,
                      center: new Text(
                        "Moderate",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.purple[300]),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: Colors.purple,
                      footer: Text('Stress',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color(0xFF251756))),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 10.0,
                      percent: 0.7,
                      center: new Text(
                        "Moderate",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.purple[300]),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: Colors.purple,
                      footer: Text(
                        'Mindfulnes',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xFF251756)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Image.asset('assets/logos/credit.png', height: 90, width: 90),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text('Total Coins : 250',
                    style: new TextStyle(
                        letterSpacing: 0.75,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color(0xFF251756))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text('Environments',
                    style: new TextStyle(
                        letterSpacing: 0.75,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color(0xFF251756))),
              ),
              getEnvironment()
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: getDrawer(),
      ),
    );
  }

  Widget getDrawer() {
    final profile = Provider.of<ProfileRepository>(context, listen: false);
    final user = Provider.of<UserRepository>(context);
    var photoUrl = "";
    profile
        .getUserDetails(user.user.uid)
        .then((value) => photoUrl = value.name);
    return Consumer(builder: (context, ProfileRepository profileRepository, _) {
      return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              alignment: Alignment.center,
              child: profileAvatar(
                  300, 300, profileRepository.userDetails.photoUrl),
            ),
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
          ),
          GestureDetector(
            child: getDrawerItem(Icons.person, 'Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          GestureDetector(
            child: getDrawerItem(Icons.history, 'History'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History()),
              );
            },
          ),
          GestureDetector(
            child: getDrawerItem(Icons.data_usage, 'Performance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Questionarie()),
              );
            },
          ),
          GestureDetector(
            child: getDrawerItem(Icons.beach_access, 'Environments'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Environment()),
              );
            },
          ),
          GestureDetector(
            child: getDrawerItem(Icons.settings, 'Setting'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modes()),
              );
            },
          ),
          // GestureDetector(
          //   child: getDrawerItem(Icons.directions_walk, 'Step Count'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Questionarie()),
          //     );
          //   },
          // ),
          Divider(),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                    // margin: const EdgeInsets.only(left: 10),
                    child: Text(
                  'Log Out',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFF251756)),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      content: Text('Are You Sure?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('No'),
                          textColor: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Yes'),
                          textColor: Colors.blue,
                          onPressed: () {
                            user
                                .signOut()
                                .then((value) => {Navigator.of(context).pop()});
                          },
                        )
                      ],
                    );
                  });
            },
          )
        ],
      );
    });
  }

  Widget getDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(
                icon,
                size: 40,
                color: Colors.purple[400],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                  child: Text(
                title,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xFF251756)),
              )))
        ],
      ),
    );
  }

  Widget getEnvironment() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            height: 200,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            initialPage: 2,
            autoPlay: true),
        items: <Widget>[
          GestureDetector(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/logos/logotrans.png',
                      height: 120, width: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logos/credit.png',
                          height: 30, width: 30),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '800',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackForm()),
              );
            },
          ),
          GestureDetector(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/logos/logotrans.png',
                      height: 130, width: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logos/credit.png',
                          height: 30, width: 30),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '800',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackForm()),
              );
            },
          ),
          GestureDetector(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/logos/logotrans.png',
                      height: 130, width: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logos/credit.png',
                          height: 30, width: 30),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '800',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackForm()),
              );
            },
          ),
          GestureDetector(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/logos/logotrans.png',
                      height: 130, width: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/logos/credit.png',
                          height: 30, width: 30),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '800',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
