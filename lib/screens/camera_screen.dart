import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  static String id = "camera_screen";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("CAMERA SCREEN"),
        ],
      ),
    );
  }
}
