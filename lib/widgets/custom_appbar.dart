import 'package:facebook_clone/utils/icon_button.dart';
import 'package:facebook_clone/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import '../App Styles/Color Style/color.dart';
import 'user_card.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  
  const CustomAppBar({
    super.key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,2),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text("facebook",style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: TAppColor.facebookBlue
            ),
                    ),
          ),
          const Spacer(),
          SizedBox(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator : true
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(currentUser : currentUser),
              const SizedBox(width: 12.0),
              TIconButton(
                iconData: Icons.search,
                iconSize: 30.0,
                onPressed: (){}
              ),
              const SizedBox(width: 12.0),
              TIconButton(
                iconData: Icons.message_outlined,
                iconSize: 30.0,
                onPressed: (){}
              ),
            ],
          )
        ],
      ),
    );
  }
}
