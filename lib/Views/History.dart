import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TextStyle textStyle =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 23);

  TextStyle textSubStyle =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFececec),
        appBar: AppBar(
          backgroundColor: Color(0xFF9d59b8),
          title: Text(
            'History',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top:7),
            child: Column(
              children: <Widget>[
                getHistoryWidget(),
                getHistoryWidget(),
                getHistoryWidget(),
              ],
            ),
          ),
        ));
  }

  Widget getHistoryWidget() {
    return Card(
      color: Colors.purple[50],
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 4, 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                    child: Text('DAY 1', style: textStyle),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                    child: Text('09/02/2019', style: textStyle),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Text(
                          'activity 1 : score 1',
                          style: textSubStyle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Text(
                          'activity 1 : score 1',
                          style: textSubStyle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Text(
                          'activity 1 : score 1',
                          style: textSubStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 70.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 5.0,
                            percent: 0.7,
                            center: new Text(
                              "Low",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.purple[300]),
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Colors.white,
                            progressColor: Colors.purple,
                            footer: Text(
                              'Stress Level',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color(0xFF251756)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircularPercentIndicator(
                            radius: 70.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 5.0,
                            percent: 0.7,
                            center: new Text(
                              "Low",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.purple[300]),
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Colors.white,
                            progressColor: Colors.purple,
                            footer: Text(
                              'Mindfulnes Level',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color(0xFF251756)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
