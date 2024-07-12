import 'package:facebook_clone/Home%20Features/profile_avatar.dart';
import 'package:flutter/material.dart';

import 'package:facebook_clone/models/models.dart';

class UserCard extends StatelessWidget {
  final User currentUser;
  const UserCard({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: currentUser.imageUrl),
          const SizedBox(width: 6.0,),
          Text(
            currentUser.name ,
              style : 
                const TextStyle(
                  fontSize: 16.0
                )
            )
        ],
      ),
    );
  }
}
