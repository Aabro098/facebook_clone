import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/Home%20Features/profile_avatar.dart';
import 'package:facebook_clone/models/post_models.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0 ,
      shape: isDesktop? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post : post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  // ignore: unnecessary_null_comparison
                  post.imageUrl != null 
                  ? const SizedBox.shrink() : 
                    const SizedBox(height: 6.0),  
                ],
              ),
            ),
            // ignore: unnecessary_null_comparison
            post.imageUrl != null 
            ? Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0,0.0, 0.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            ) 
            : const SizedBox.shrink() ,
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name , style: const TextStyle(
                fontWeight: FontWeight.w600
              ),),
              Row(
                children: [
                  Text('${post.timeAgo}*', style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0
                  ),),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                  const Icon(Icons.more_horiz)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}