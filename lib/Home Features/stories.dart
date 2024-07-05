import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../App Styles/Color Style/color.dart';
import '../models/story_model.dart';
import '../models/user_models.dart';
import 'profile_avatar.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    super.key, 
    required this.currentUser, 
    required this.stories
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0
        ),
        scrollDirection: Axis.horizontal,
        itemCount : 1+ stories.length,
        itemBuilder: (BuildContext context , int index){
          if (index==0){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory : true,
                currentUser : currentUser
              ),
            );
          }
          final Story story = stories[index-1];
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
            child: _StoryCard(story : story),
          );
        }
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: TAppColor.storyGradient,
            borderRadius: BorderRadius.circular(12.0) 
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ?
            Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                icon: const Icon(Icons.add),
                iconSize: 30.0,
                color: TAppColor.facebookBlue,
              ),
            ) : story?.user != null
                ? ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  hasBorder: story!.isViewed,
                )
                : const SizedBox.shrink(), 
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to story' : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        )
      ],
    );
  }
}