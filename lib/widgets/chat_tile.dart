import 'package:flutter/material.dart';
import 'package:snapfake/screens/app/chat_screen.dart';

class ChatTile extends StatelessWidget {
  String name;

  ChatTile({@required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.account_circle,
                color: Colors.blueAccent,
                size: 40.0,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name != null ? name : "Username",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  "Received - 1h",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
