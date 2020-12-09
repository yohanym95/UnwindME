import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Views/History.dart';
import 'package:flutter_maaapp/Views/Home.dart';
import 'package:flutter_maaapp/Views/Profile.dart';
import 'package:flutter_maaapp/Views/Questionarie.dart';

enum Gender { Male, Female }

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _age = TextEditingController();

  Gender _gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFececec),
        appBar: AppBar(
          backgroundColor: Color(0xFF9d59b8),
          title: Text(
            'Personal Details',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 15, left: 5, right: 5, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _height,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter your Height';
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Height',
                              focusColor: Colors.purple,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15.0),
                              hintText: 'Enter Your Height',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _weight,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter your Weight';
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Weight',
                                focusColor: Colors.purple,
                                labelStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15.0),
                                hintText: 'Enter Your Weight',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 5, 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 5),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Color(0xFF251756),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                )),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    child: ListTile(
                                      title: const Text(
                                        'Male',
                                        style: TextStyle(
                                            color: Color(0xFF251756),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      leading: Radio(
                                        value: Gender.Male,
                                        groupValue: _gender,
                                        onChanged: (Gender value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: ListTile(
                                      title: const Text(
                                        'Female',
                                        style: TextStyle(
                                            color: Color(0xFF251756),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      leading: Radio(
                                        value: Gender.Female,
                                        groupValue: _gender,
                                        onChanged: (Gender value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 15, left: 5, right: 5, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _age,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty) return 'Please Enter your Age';
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Age',
                              focusColor: Colors.purple,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15.0),
                              hintText: 'Age Should be 20 - 30',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ),
                    _submitButton()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: MaterialButton(
        textColor: Color(0xFF251756),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
          child: Text('Go Next',
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
          );
        },
        color: Color(0xFF9d59b8),
      ),
    );
  }
}
