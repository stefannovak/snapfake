import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snapfake/screens/app/camera_screen.dart';
import 'package:snapfake/screens/app/chatlist_screen.dart';
import 'package:snapfake/screens/app/page_view.dart';
import 'package:snapfake/screens/app/story_screen.dart';
import 'package:snapfake/screens/home/home_screen.dart';
import 'package:snapfake/screens/home/registration_screen.dart';

//void main() {
//  runApp(MyApp());
//}

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CameraScreen.id: (context) => CameraScreen(camera: firstCamera),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatListScreen.id: (context) => ChatListScreen(),
        StoryScreen.id: (context) => StoryScreen(),
        MyPageView.id: (context) => MyPageView(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
//  final CameraDescription cameraDescription;
//
//  MyApp(this.cameraDescription);

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
