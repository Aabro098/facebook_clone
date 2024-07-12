import 'package:facebook_clone/Screens/Home%20Screen/home_screen.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
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
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) 
        ? PreferredSize(
          preferredSize: Size
          (
            screenSize.width, 100.0
          ),
          child: CustomAppBar(
            currentUser : currentUser,
            icons : _icons,
            selectedIndex : selectedIndex,
            onTap : (index) => setState(() => selectedIndex = index)
          )
        ): null,
        body : IndexedStack(
          index: selectedIndex,
          children: _screens
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container (
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
            icons : _icons,
            selectedIndex : selectedIndex,
            onTap : (index) => setState(() => selectedIndex = index)
          ),
        ) : const SizedBox.shrink(),
      )
    );
  }
}