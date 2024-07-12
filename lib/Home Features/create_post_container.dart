
import 'package:facebook_clone/models/user_models.dart';
import 'package:flutter/material.dart';

import '../utils/text_button.dart';
import '../widgets/responsive.dart';
import 'profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    super.key, 
    required this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context) ;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0 ,
      shape: isDesktop? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
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
      ),
    );
  }
}

