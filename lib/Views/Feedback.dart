import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackForm> {
  TextStyle textStyle =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: Color(0xFF251756) );
  TextStyle textStyle1 =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 21,color: Color(0xFF251756) );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        backgroundColor: Color(0xFF9d59b8),
        title: Text(
          'FeedBack',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.done_outline,
                size: 100,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'You have done this activity',
                    style: textStyle,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Did you like the activity ?',
                    style: textStyle1,
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage("assets/logos/love.png"),
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage("assets/logos/happy.png"),
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage("assets/logos/sad.png"),
                        height: 54,
                        width: 53,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage("assets/logos/angry.png"),
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
