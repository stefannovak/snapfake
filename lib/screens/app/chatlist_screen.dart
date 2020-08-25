import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:snapfake/constants.dart';
import 'package:snapfake/widgets/add_button.dart';
import 'package:snapfake/widgets/chat_tile.dart';
import 'package:firebase_admin/firebase_admin.dart';

import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  static String id = "chatlist_screen";

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final messageTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String userInput;

  List<ChatTile> chats = [
    ChatTile(name: "Sammie"),
    ChatTile(name: "Joe"),
    ChatTile(name: "Anthony"),
  ];

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
              setState(() {
                userInput = value;
              });
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: () async {
                var getUser =
                    await _firestore.collection('userinfo').doc(userInput);

                getUser.get().then((value) {
                  if (value.exists) {
                    print("Document data: ${value.data}");
                    print(value.get("username"));

                    print("${chats.length}FDLKGJHSFGJKGHFDGKJGHKJFDGG");

                    ///Time to create a new chatlist icon with this data
                    setState(() {
                      chats.add(
                        ChatTile(
                          name: value.get("username"),
                        ),
                      );
                    });
                    print(chats.length);
                  } else {
                    print("No such document!");
                  }
                }).catchError((onError) {
                  print("Error getting document: $onError");
                });
                Navigator.of(context).pop();
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
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatTile(name: chats[index].name);
        },
        itemCount: chats.length,
//        children: <Widget>[
//          ChatTile(name: "Test Name"),
//        ],
//        children: chats,
      ),
    );
  }
}
