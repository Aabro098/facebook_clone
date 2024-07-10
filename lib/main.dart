import 'package:facebook_clone/App%20Styles/Color%20Style/color.dart';
import 'package:facebook_clone/Screens/nav_screen.dart';
import 'package:facebook_clone/router.dart';
import 'package:flutter/material.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: TAppColor.scaffold
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const NavScreen(),
    );
  }
}