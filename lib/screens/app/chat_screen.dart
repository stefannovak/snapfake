import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snapfake/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen_id";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  ///Gets the current user.
  void getCurrentUser() async {
    final user = await _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        print(loggedInUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ///TOP
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.account_circle),
                    Text(
                      "Username",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),

              ///Middle
              Container(),

              ///Bottom
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        controller: messageTextController,
                        onChanged: (value) {
                          //Do something with the user input.
                          messageText = value;
                          print(value);
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        _firestore.collection('messages').add({
                          'sender': loggedInUser.email,
                          'text': messageText,
                          'username': loggedInUser.displayName,
                        });
                        messageTextController.clear();
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
