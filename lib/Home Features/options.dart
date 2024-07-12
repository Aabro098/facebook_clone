import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  
  const Options({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          Icon(icon , size: 38 , color: color,),
          const SizedBox(
            width : 6.0,
          ),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16.0
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
