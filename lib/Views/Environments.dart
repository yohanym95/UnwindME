import 'package:flutter/material.dart';

enum Environments { Beach, Forest, Automatic }

class Environment extends StatefulWidget {
  @override
  _EnvironmentState createState() => _EnvironmentState();
}

class _EnvironmentState extends State<Environment> {
  TextStyle textStyle = new TextStyle(
      fontWeight: FontWeight.w500, fontSize: 21, color: Color(0xFF251756));

  Environments _environments = Environments.Automatic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        backgroundColor: Color(0xFF9d59b8),
        title: Text(
          'Environments',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            getModes(Environments.Beach, 'Beach Environment'),
            getModes(Environments.Forest, 'Forest Environment'),
            getModes(Environments.Automatic, 'Automatic'),
            playButton()
          ],
        ),
      ),
    );
  }

  Widget getModes(Environments modetype, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: textStyle,
            ),
            leading: Radio(
              value: modetype,
              groupValue: _environments,
              onChanged: (Environments value) {
                setState(() {
                  _environments = value;
                });
              },
            ),
          ),
        ],
      )),
    );
  }

  Widget playButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: MaterialButton(
        textColor: Color(0xFF251756),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
          child: Text('PLAY',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Profile()),
          // );
        },
        color: Color(0xFF9d59b8),
      ),
    );
  }
}
