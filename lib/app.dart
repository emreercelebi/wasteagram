import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/photo_detail.dart';
import 'screens/camera_screen.dart';

class App extends StatelessWidget {

  static final routes = {
    HomePage.route: (context) => HomePage(),
    PhotoDetail.route: (context) => PhotoDetail(),
    CameraScreen.route: (context) => CameraScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: routes,
    );
  }
}