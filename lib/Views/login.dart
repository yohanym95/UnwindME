import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Views/Registration.dart';
import 'package:flutter_maaapp/Views/personalDetails.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage("assets/logos/logotrans.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 0, bottom: 5.0, left: 5, right: 5),
                      child: TextFormField(
                        controller: _email,
                        //style: textStyle,
                        validator: validateEmail1,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            focusColor: Colors.purple,
                            labelStyle:
                                TextStyle(fontSize: 18.0, color: Colors.black),
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
                          top: 5.0, bottom: 5.0, left: 5, right: 5),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        //style: textStyle,
                        validator: validateEmail1,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            focusColor: Colors.purple,
                            labelStyle:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                            prefixIcon: Icon(Icons.lock_outline),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                            hintText: 'Enter Your Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      )),
                ),
                _loginButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _signInButton(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          style:
                              TextStyle(color: Color(0xFF9d59b8), fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(0xFF9d59b8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.purple,
      onPressed: () {
        setState(() {
          //  _isLoading = true;
        });
        // check();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/logos/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign In with Google',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF9d59b8),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: MaterialButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PersonalDetails()),
            (Route<dynamic> route) => false,
          );
        },
        color: Color(0xFF9d59b8),
      ),
    );
  }
}
