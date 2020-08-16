import 'package:flutter/material.dart';
import 'package:snapfake/screens/app/camera_screen.dart';
import 'package:snapfake/screens/app/chatlist_screen.dart';
import 'package:snapfake/screens/app/story_screen.dart';

class MyPageView extends StatefulWidget {
  static String id = "my_page_view";
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _controller = PageController(
    initialPage: 1,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: <Widget>[
        ChatListScreen(),
        CameraScreen(),
        StoryScreen(),
      ],
    );
  }
}
