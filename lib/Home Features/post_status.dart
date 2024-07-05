import 'package:flutter/material.dart';

import '../App Styles/Color Style/color.dart';
import '../models/post_models.dart';

class PostStats extends StatelessWidget {
  final Post post;
  const PostStats({    
    super.key, 
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: TAppColor.facebookBlue,
                 shape: BoxShape.circle
              ),
              child: const Icon(
                Icons.thumb_up , 
                size: 10.0, 
                color: Colors.white,               
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(post.likes.toString() , style: TextStyle(
                color: Colors.grey[600]
              ),),
            ),
            Text('${post.comments.toString()} Comments', style: TextStyle(
              color: Colors.grey[600]
            ),),
            const SizedBox(
              width: 4.0,
            ),
            Text('${post.shares.toString()} Shares' , style: TextStyle(
              color: Colors.grey[600]
            ),),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          color: Colors.white,
          height: 28,
          child: Row(
            children: [
              _PostButton(
                icon:Icon(
                  Icons.thumb_up , 
                  color : Colors.grey[600], 
                  size : 20.0
                ), 
                label : 'Like',
                onTap : (){}
              ),
              _PostButton(
                icon:Icon(
                  Icons.comment , 
                  color : Colors.grey[600], 
                  size : 20.0
                ), 
                label : 'Comments',
                onTap : (){}
              ), 
              _PostButton(
                icon:Icon(
                  Icons.share , 
                  color : Colors.grey[600], 
                  size : 25.0
                ), 
                label : 'Share',
                onTap : (){}
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;


  const _PostButton({
    required this.icon, 
    required this.label, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal : 12.0),
            child: SizedBox(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(label)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}