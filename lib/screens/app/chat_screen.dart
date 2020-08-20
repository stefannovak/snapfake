import 'package:flutter/material.dart';
import 'package:snapfake/constants.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen_id";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

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
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
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
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.camera_alt),
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
                          print(value);
                        },
                        decoration: kMessageTextFieldDecoration,
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
