import 'package:flutter/material.dart';
import 'package:snapfake/screens/camera_screen.dart';
import 'package:snapfake/screens/home_screen.dart';
import 'package:snapfake/screens/registration_screen.dart';

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
      },
    );
  }
}
