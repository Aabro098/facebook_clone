import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/App%20Styles/Color%20Style/color.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    super.key, 
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: hasBorder ? TAppColor.facebookBlue : Colors.grey,
          child: CircleAvatar(
            radius: 17,
            backgroundColor : Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive ?
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                color: TAppColor.online,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.white
                )
              ),
            ),
          ) : const SizedBox.shrink()
      ],
    );
  }
}