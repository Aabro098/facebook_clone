import 'package:flutter/material.dart';

import '../utils/text_button.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 30,
                // backgroundImage: Image(image: )
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind ?"
                  ),
                ),
              ),
              Divider(height: 10, thickness: 0.5)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TTextButton(
                iconData: Icons.live_tv ,          
                onPressed: () {}, 
                labelText: 'Live', 
                color: Colors.red, 
              ),
              const VerticalDivider(width: 8,),
              TTextButton(
                iconData: Icons.photo , 
                onPressed: () {}, 
                labelText: 'Photo', 
                color: Colors.green,
              ),
              const VerticalDivider(width: 8,),
              TTextButton(
                iconData: Icons.room_outlined , 
                onPressed: () {}, 
                labelText: 'Room', 
                color: Colors.purple,
              ),
            ],
          )
        ],
      ),
    );
  }
}

