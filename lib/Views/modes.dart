import 'package:flutter/material.dart';

enum modes { VRWERABLE, VR, WEARABLE, NORMAL }

class Modes extends StatefulWidget {
  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  TextStyle textStyle = new TextStyle(
      fontWeight: FontWeight.w500, fontSize: 21, color: Color(0xFF251756));
  TextStyle subTextStyle = new TextStyle(fontSize: 15);

  modes _mode = modes.VR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        backgroundColor: Color(0xFF9d59b8),
        title: Text(
          'Modes',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15,),
            getModes(modes.VRWERABLE, 'VR Headset + Wearable Device',
                'You Need a VR headset and wearable hardwear device'),
            getModes(modes.VR, 'Only VR headset', 'You Need only a VR headset'),
            getModes(modes.WEARABLE, 'Only wearable device',
                'You Need only a fitbit smart watch'),
            getModes(modes.NORMAL, 'Normal', ''),
            playButton()
          ],
        ),
      ),
    );
  }

  Widget getModes(modes modetype, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: <Widget>[
          subtitle.length > 1
              ? ListTile(
                  title: Text(
                    title,
                    style: textStyle,
                  ),
                  subtitle: Text(
                    subtitle,
                    style: subTextStyle,
                  ),
                  leading: Radio(
                    value: modetype,
                    groupValue: _mode,
                    onChanged: (modes value) {
                      setState(() {
                        _mode = value;
                      });
                    },
                  ),
                )
              : ListTile(
                  title: Text(
                    title,
                    style: textStyle,
                  ),
                  leading: Radio(
                    value: modetype,
                    groupValue: _mode,
                    onChanged: (modes value) {
                      setState(() {
                        _mode = value;
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
