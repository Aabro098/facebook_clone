import 'package:flutter/material.dart';

import 'package:facebook_clone/data/data.dart';

import '../../Home Features/contact_list.dart';
import '../../Home Features/create_post_container.dart';
import '../../Home Features/more_option.dart';
import '../../Home Features/post_container.dart';
import '../../Home Features/post_status.dart';
import '../../Home Features/rooms.dart';
import '../../Home Features/stories.dart';
import '../../models/post_models.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeScreenDesktop({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionList(currentUser : currentUser),
            ),
          )
        ),
        const Spacer(),
        SizedBox(
          width: 550,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver : SliverToBoxAdapter(
                  child: Stories(currentUser : currentUser , stories : stories),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver : SliverToBoxAdapter(
                  child: Rooms(onlineUsers : onlineUsers),
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
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactList(users : onlineUsers),
            ),
          )
        ),
      ],
    );
  }
}
