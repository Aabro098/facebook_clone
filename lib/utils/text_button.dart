import 'package:flutter/material.dart';

class TTextButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String labelText;
  final Color color;
  
  const TTextButton({
    super.key,
    required this.iconData, 
    required this.onPressed, 
    required this.labelText,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: (){},
        icon: Icon(iconData,
        color:color
      ),
      label: Text(labelText),
    );
  }
}