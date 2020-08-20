import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snapfake/screens/home/home_screen.dart';

import '../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String username;
  bool showSpinner = false;

  Future registerUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await newUser.user.updateProfile(displayName: username);
      await newUser.user.reload();
      if (newUser != null) {
        Navigator.pushNamed(context, HomeScreen.id);
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 75.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter a username"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your email"),
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
                  height: 24.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });
                    registerUser();
                  },
                  child: Text("Register"),
                  color: Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
