import 'package:facebook_clone/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_models.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth : 280),
      child :  Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Contacts', 
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                  ),
                ),
              ),
              Icon(
                Icons.search , 
                size: 24, 
                color: Colors.grey[600],
              ),
              Icon(
                Icons.more_horiz , 
                size: 24, 
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount : users.length,
              itemBuilder: (BuildContext context , int index){
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8 ),
                  child: UserCard(currentUser: user),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
