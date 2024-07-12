import 'package:facebook_clone/App%20Styles/Color%20Style/color.dart';
import 'package:facebook_clone/Home%20Features/options.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_models.dart';

class MoreOptionList extends StatefulWidget {
  final List<List> moreOptionList = const [
    [Icons.group_add_outlined , Colors.cyan, 'Freinds'],
    [Icons.messenger_outline , TAppColor.facebookBlue, 'Messenger'],
    [Icons.flag , Colors.orange, 'Pages'],
    [Icons.store , TAppColor.facebookBlue, 'Marketplace'],
    [Icons.video_call_outlined , TAppColor.facebookBlue, 'Watch'],
    [Icons.calendar_month_outlined , Colors.red, 'Events'],
  ];

  final User currentUser;

  const MoreOptionList({
    super.key,
    required this.currentUser,
  });

  @override
  State<MoreOptionList> createState() => _MoreOptionListState();
}

class _MoreOptionListState extends State<MoreOptionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + widget.moreOptionList.length,
        itemBuilder: (BuildContext context , int index){
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: UserCard(currentUser: currentUser),
            );
          }
          final List option = widget.moreOptionList[index-1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Options(
              icon : option[0],
              color : option[1],
              label : option[2]
            ),
          );
      }),
    );
  }
}