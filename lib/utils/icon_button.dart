import 'package:flutter/material.dart';

class TIconButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final VoidCallback onPressed;

  const TIconButton({ 
    required this.iconData, 
    required this.iconSize, 
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200]
      ),
      child: IconButton(
        onPressed: () => onPressed, 
        icon: Icon(
          iconData,
          color: Colors.black,
          size: iconSize,
        )
      ),
    );
  }
}
