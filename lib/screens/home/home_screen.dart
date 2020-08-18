import 'package:bordered_text/bordered_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snapfake/screens/app/page_view.dart';
import 'file:///E:/Projects/flutter/myapps/snapfake/lib/screens/app/camera_screen.dart';
import 'package:snapfake/screens/home/registration_screen.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellowAccent,
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 4.0,
                  child: Text(
                    "SnapFake",
                    style: kTitleStyle,
                  ),
                ),
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 160.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Enter your email",
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter your password"),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      onPressed: () async {
//                        Navigator.pushNamed(context, MyPageView.id);
                        try {
                          final newUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, MyPageView.id);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text("Log In"),
                      color: Colors.green,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      child: Text("New to SnapFake?"),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      child: Text("Register"),
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
