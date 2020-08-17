import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  static String id = "story_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("Info selected");
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Stories | Contacts",
                    style: TextStyle(fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Add contact selected");
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Stories"),
//                  ListView(
////                    scrollDirection: Axis.horizontal,
//                    children: <Widget>[
//                      CircleAvatar(
//                        child: Icon(Icons.visibility),
//                      ),
//                    ],
//                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
