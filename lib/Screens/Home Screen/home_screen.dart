
import 'package:flutter/material.dart';
import '../../Home Features/create_post_container.dart';
import '../../Home Features/rooms.dart';
import '../../data/data.dart';
import '../../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TAppbar(),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver : SliverToBoxAdapter(
              child: Rooms(onlineUsers : onlineUsers),
            ),
          )
        ],
      )
    );
  }
}
