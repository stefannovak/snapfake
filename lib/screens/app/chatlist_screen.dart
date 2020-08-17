import 'package:flutter/material.dart';
import 'package:snapfake/widgets/add_button.dart';
import 'package:snapfake/widgets/chat_tile.dart';

class ChatListScreen extends StatelessWidget {
  static String id = "chatlist_screen";

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
            print("New convo clicked");
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ChatTile(),
        ],
      ),
    );
  }
}
