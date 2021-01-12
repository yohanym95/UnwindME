import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Views/personalDetails.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    return Scaffold(
        backgroundColor: Color(0xFFececec),
        appBar: AppBar(
          backgroundColor: Color(0xFF9d59b8),
          title: Text(
            'Registration',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isLoading,
          color: Colors.purple[200],
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage("assets/logos/registration.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 5.0, left: 5, right: 5),
                            child: TextFormField(
                              controller: _username,
                              //style: textStyle,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Please Enter your User Name';
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'User Name',
                                focusColor: Colors.purple,
                                labelStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                                prefixIcon: Icon(Icons.person),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15.0),
                                hintText: 'Enter Your User Name',
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
                              controller: _email,
                              validator: validateEmail1,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  focusColor: Colors.purple,
                                  labelStyle: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  prefixIcon: Icon(Icons.email),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0),
                                  hintText: 'Enter Your Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 0, left: 5, right: 5),
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  focusColor: Colors.purple,
                                  labelStyle: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0),
                                  hintText: 'Enter Your Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            )),
                      ),
                      _loginButton(
                          user, _email.text, _password.text, _username.text)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  String validateEmail1(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter your Valid Email';
    }
    return null;
  }

  Widget _loginButton(
      UserRepository user, String email, String password, String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: MaterialButton(
        textColor: Color(0xFF251756),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
          child: Text(
            'Register',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              _isLoading = true;
            });
            if (await user.signUp(email, password)) {
              // final profile = Provider.of<ProfileRepository>(context);
              // await profile.addUserDetails(userDetails, context, uid)
              setState(() {
                _isLoading = false;
              });
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PersonalDetails(name)),
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
