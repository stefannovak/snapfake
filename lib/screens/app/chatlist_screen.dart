import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:snapfake/constants.dart';
import 'package:snapfake/widgets/add_button.dart';
import 'package:snapfake/widgets/chat_tile.dart';

import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  static String id = "chatlist_screen";

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String userInput;

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a friend'),
          content: TextField(
//            decoration: kTextFieldDecoration,
            onChanged: (value) {
              userInput = value;
              print(value);
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: () {
//                    Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: AddButton(
          onTap: () {
            _showMyDialog(context);
            print("New convo clicked");
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: ChatTile(),
            onTap: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
