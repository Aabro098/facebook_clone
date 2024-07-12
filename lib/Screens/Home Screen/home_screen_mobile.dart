import 'package:flutter/material.dart';

import '../../Home Features/create_post_container.dart';
import '../../Home Features/post_container.dart';
import '../../Home Features/post_status.dart';
import '../../Home Features/rooms.dart';
import '../../Home Features/stories.dart';
import '../../data/data.dart';
import '../../models/post_models.dart';
import '../../widgets/appbar.dart';

class HomeScreenMobile extends StatefulWidget {
  final TrackingScrollController scrollController;
  const HomeScreenMobile({
    super.key,
    required this.scrollController,
  });

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
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
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver : SliverToBoxAdapter(
            child: Stories(currentUser : currentUser , stories : stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context , index){
              final Post post = posts[index];
              return Column(
                children: [
                  PostContainer(post : post),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: PostStats(post : post),
                  )
                ],
              );
            },
            childCount: posts.length
          )
        ),
      ],
    );
  }
}

 