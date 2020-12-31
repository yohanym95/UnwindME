import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maaapp/Views/Home.dart';
import 'package:flutter_maaapp/models/User.dart';
import 'package:flutter_maaapp/services/ProfileRepository.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:image_picker/image_picker.dart';
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
  String photoUrl;
  File _imageFile;
  StorageReference reference;

  Gender _gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileRepository>(context, listen: false);
    final user = Provider.of<UserRepository>(context, listen: false);
    if (user.user.displayName != null) {
      _name.text = user.user.displayName;
    } else if (name != null) {
      _name.text = name;
    }

    _email.text = user.user.email;
    if (user.user.photoURL != null) {
      photoUrl = user.user.photoURL;
    }
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
                    photoUrl == null
                        ? GestureDetector(
                            child: Container(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.blue[100],
                                  size: 70,
                                ),
                              ),
                            ),
                            onTap: () {
                              askCapture(context);
                            },
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              child: ClipOval(
                                child: Image.network(
                                  photoUrl,
                                  // height: 150,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                    Container(
                      margin:
                          EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 5, right: 5),
                          child: TextFormField(
                            controller: _name,
                            //style: textStyle,
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter Your Name';
                              return null;
                            },
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
                            onEditingComplete: () {
                              _height.text = _height.text.toString() + 'Cm';
                            },
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
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please Enter your Weight';
                              return null;
                            },
                            onEditingComplete: () {
                              _weight.text = _weight.text.toString() + 'Kg';
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
                    _submitButton(user, profile)
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

  Widget _submitButton(UserRepository user, ProfileRepository profile) {
    //  var ageValue = int.parse(age);
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
            if (photoUrl != null) {
              UserDetails userDetails = new UserDetails(
                  _name.text,
                  _height.text.toString(),
                  _weight.text.toString(),
                  _gender.toString(),
                  _height.text.toString(),
                  _email.text,
                  photoUrl);
              if (await profile.addUserDetails(userDetails, context, uid)) {
                setState(() {
                  _isLoading = false;
                });
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              } else {}
            } else {
              return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      content: Text('Please Add the profile picture'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          textColor: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        ),
                      ],
                    );
                  });
            }
          }
        },
        color: Color(0xFF9d59b8),
      ),
    );
  }

  Future askCapture(BuildContext context) async {
    switch (await showDialog(
        context: context,
        child: Center(
          child: new SimpleDialog(
            contentPadding:
                EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            title: new Text(
              'Choose Your Profile Picture',
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Icon(
                          Icons.photo,
                          color: Colors.blue[400],
                          size: 70,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        getImage(false).then((onImage) {
                          uploadImage(onImage);
                        });
                      },
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.blue[400],
                          size: 70,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        getImage(true).then((onImage) {
                          uploadImage(onImage);
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ))) {
    }
  }

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imageFile = image;
    });
    return _imageFile;
  }

  Future uploadImage(File imagePath) async {
    reference = FirebaseStorage.instance
        .ref()
        .child('Profiles/${Path.basename(imagePath.path)}');
    //chats/${Path.basename(_imageFile.path)}
    StorageUploadTask uploadTask = reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String setImageUrl = await taskSnapshot.ref.getDownloadURL();
    setState(() {
      // _uploaded = true;
      photoUrl = setImageUrl;
    });
  }
}
