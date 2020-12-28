import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maaapp/Views/Home.dart';
import 'package:flutter_maaapp/models/User.dart';
import 'package:flutter_maaapp/services/ProfileRepository.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

enum Gender { Male, Female }

class PersonalDetails extends StatefulWidget {
  String name;
  PersonalDetails([this.name]);
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState(this.name);
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String name;
  _PersonalDetailsState([this.name]);
  var _formKey = GlobalKey<FormState>();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  bool _isLoading = false;

  Gender _gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileRepository>(context, listen: false);
    final user = Provider.of<UserRepository>(context, listen: false);
    _name.text = user.user.displayName;
    _email.text = user.user.email;
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
        body: ModalProgressHUD(
          inAsyncCall: _isLoading,
          color: Colors.purple[200],
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
                            controller: _name,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter Your Name';
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              focusColor: Colors.purple,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15.0),
                              hintText: 'Enter Your Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _email,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter Your Email';
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              focusColor: Colors.purple,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15.0),
                              hintText: 'Enter Your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _height,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter your Height';
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Height',
                              focusColor: Colors.purple,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15.0),
                              hintText: 'Enter Your Height (cm)',
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
                            keyboardType: TextInputType.number,
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
                                hintText: 'Enter Your Weight (Kg)',
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
                            keyboardType: TextInputType.number,
                            validator: validateAge,
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
                    _submitButton(_name.text, 111.0, 50.0, "Male",
                        int.parse(_age.text), _email.text, user, profile)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  String validateAge(String age) {
    int value = int.parse(age);

    if (value < 20 || value > 30) {
      return 'Your Age Should be 20 - 30';
    }
    return null;
  }

  Widget _submitButton(
      String username,
      double height,
      double weight,
      String gender,
      int age,
      String email,
      UserRepository user,
      ProfileRepository profile) {
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
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              _isLoading = true;
            });
            var uid;
            await user.getCurrentUser().then((value) => {uid = value.uid});
            print(uid);
            UserDetails userDetails =
                new UserDetails(username, height, weight, gender, age, email);
            if (await profile.addUserDetails(userDetails, context, uid)) {
              setState(() {
                _isLoading = false;
              });
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                (Route<dynamic> route) => false,
              );
            } else {
              setState(() {
                _isLoading = false;
              });
            }
          }
        },
        color: Color(0xFF9d59b8),
      ),
    );
  }
}
