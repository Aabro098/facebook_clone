import 'package:facebook_clone/App%20Styles/Color%20Style/color.dart';
import 'package:facebook_clone/Home%20Features/profile_avatar.dart';
import 'package:facebook_clone/models/user_models.dart';
import 'package:flutter/material.dart';

import '../widgets/responsive.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context) ;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0 ,
      shape: isDesktop? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
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
            final User user =onlineUsers[index-1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
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
