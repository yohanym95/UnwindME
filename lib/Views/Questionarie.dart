import 'package:flutter/material.dart';

class Questionarie extends StatefulWidget {
  @override
  _QuestionarieState createState() => _QuestionarieState();
}

class _QuestionarieState extends State<Questionarie> {
  TextStyle textStyle =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 21);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        backgroundColor: Color(0xFF9d59b8),
        title: Text(
          'Questionnaire',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'I have a hard time feeling really relaxed',
                  style: textStyle,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  _submitButton('ALWAYS'),
                  _submitButton('ALMOST ALWAYS'),
                  _submitButton('SOMETIMES'),
                  _submitButton('RARELY'),
                  _submitButton('NEVER')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _submitButton(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
      child: Container(
        width: double.infinity,
        child: MaterialButton(
          textColor: Colors.white,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {},
          color: Color(0xFF9d59b8),
        ),
      ),
    );
  }
}
