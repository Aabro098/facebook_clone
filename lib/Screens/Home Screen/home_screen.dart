
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController trackingScrollController = TrackingScrollController();

  @override
  void dispose(){
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController : trackingScrollController),
          desktop: HomeScreenDesktop(scrollController : trackingScrollController),          
        )
      ),
    );
  }
}

