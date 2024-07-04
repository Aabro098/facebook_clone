import 'package:facebook_clone/App%20Styles/Color%20Style/color.dart';
import 'package:facebook_clone/models/user_models.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(2.0),
            height: 20.0,
            width: 20.0,
            color: Colors.red,
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(
            width: 3.0,
            color: Colors.blueAccent,
          ),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(TAppColor.facebookBlue),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => TAppColor.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call , 
              size: 35.0 ,
              color: Colors.white,),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Text("Create\nRoom")
        ],
      ),
    );
  }
}
