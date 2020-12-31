import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Widgets/profile.dart';
import 'package:flutter_maaapp/models/User.dart';
import 'package:flutter_maaapp/services/ProfileRepository.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final profile = Provider.of<ProfileRepository>(context, listen: false);
    final user = Provider.of<UserRepository>(context);
    var nameVal = "";
    profile.getUserDetails(user.user.uid).then((value) => nameVal = value.name);

    // profile.getUserDetails(user.user.uid);
    return ChangeNotifierProvider(
      create: (_) => ProfileRepository.instance(),
      child: Scaffold(
        backgroundColor: Color(0xFFececec),
        appBar: AppBar(
          backgroundColor: Color(0xFF9d59b8),
          title: Text('Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        body: Consumer<ProfileRepository>(
            builder: (context, ProfileRepository profileRepository, _) {
          return SingleChildScrollView(
              child: nameVal.length > 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(5, 15, 5, 8),
                            alignment: Alignment.topCenter,
                            child: profileAvatar(width, height,
                                profileRepository.userDetails.photoUrl)),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                            child: getText(profileRepository.userDetails.name,
                                25, FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: getText(profileRepository.userDetails.email,
                                20, FontWeight.w500),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                getText(profileRepository.userDetails.height,
                                    18, FontWeight.w500),
                                SizedBox(
                                  width: 10,
                                ),
                                getText(profileRepository.userDetails.weight,
                                    18, FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: getText(profileRepository.userDetails.gender, 18, FontWeight.w500),
                          ),
                        ),
                        Image.asset('assets/logos/logotrans.png',
                            height: 100, width: 100),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
                            child: getText('Level 7', 18, FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new LinearPercentIndicator(
                            width: width - 20,
                            lineHeight: 8.0,
                            percent: 0.5,
                            progressColor: Colors.purple,
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 5),
                                  child: getText(
                                      'Bronze Badge', 23, FontWeight.w800),
                                ),
                              ),
                              Image.asset('assets/logos/badge1.png',
                                  height: 50, width: 50),
                            ],
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height / 3),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.purpleAccent,
                          ),
                        ),
                      ),
                    ));
        }),
      ),
    );
  }

  Widget getText(String text, double fontSize, FontWeight fontWeight) {
    return Container(
        child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Color(0xFF251756),
      ),
    ));
  }
}
