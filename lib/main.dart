import 'package:flutter/material.dart';
import 'package:snapfake/screens/app/camera_screen.dart';
import 'package:snapfake/screens/app/chatlist_screen.dart';
import 'package:snapfake/screens/app/page_view.dart';
import 'package:snapfake/screens/app/story_screen.dart';
import 'package:snapfake/screens/home/home_screen.dart';
import 'package:snapfake/screens/home/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CameraScreen.id: (context) => CameraScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatListScreen.id: (context) => ChatListScreen(),
        StoryScreen.id: (context) => StoryScreen(),
        MyPageView.id: (context) => MyPageView(),
      },
    );
  }
}
