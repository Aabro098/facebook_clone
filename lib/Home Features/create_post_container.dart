
import 'package:facebook_clone/models/user_models.dart';
import 'package:flutter/material.dart';

import '../utils/text_button.dart';
import 'profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: currentUser.imageUrl, 
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind ?"
                  ),
                ),
              ),
              Divider(height: 15, thickness: 1, color: Colors.grey[200])
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TTextButton(
                iconData: Icons.live_tv ,          
                onPressed: () {}, 
                labelText: 'Live', 
                color: Colors.red, 
              ),
              const VerticalDivider(width: 8,),
              TTextButton(
                iconData: Icons.photo , 
                onPressed: () {}, 
                labelText: 'Photo', 
                color: Colors.green,
              ),
              const VerticalDivider(width: 8,),
              TTextButton(
                iconData: Icons.room_outlined , 
                onPressed: () {}, 
                labelText: 'Room', 
                color: Colors.purple,
              ),
            ],
          )
        ],
      ),
    );
  }
}

