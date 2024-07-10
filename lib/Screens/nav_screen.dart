import 'package:facebook_clone/Screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_tabbar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.group_outlined,
    Icons.notifications,
    Icons.menu

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body : IndexedStack(
          index: selectedIndex,
          children: _screens
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
            icons : _icons,
            selectedIndex : selectedIndex,
            onTap : (index) => setState(() => selectedIndex = index)
          ),
        ),
      )
    );
  }
}