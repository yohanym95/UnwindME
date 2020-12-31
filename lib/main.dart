import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maaapp/Views/Home.dart';
import 'package:flutter_maaapp/Views/login.dart';
import 'package:flutter_maaapp/Views/personalDetails.dart';
import 'package:flutter_maaapp/models/status.dart';
import 'package:flutter_maaapp/services/ProfileRepository.dart';
import 'package:flutter_maaapp/services/UserRepository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository.instance(),
        ),
        ChangeNotifierProvider<ProfileRepository>(
          create: (_) => ProfileRepository.instance(),
        )
      ],
      child: MaterialApp(
        title: 'UNWIND',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<UserRepository>(
          builder: (context, UserRepository user, _) {
            switch (user.status) {
              case Status.Uninitialized:
                return Splash();
              case Status.Unauthenticated:
                return Login();
              case Status.Authenticating:
                return Login();
              case Status.Authenticated:
                return Home();
              case Status.FirstAuth:
                return PersonalDetails();
            }
          },
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: Image(image: AssetImage("assets/logos/logotrans.png")),
          ),
        ),
      ),
    );
  }
}
