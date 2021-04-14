import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionIconHeader extends StatelessWidget {
  final String sectionName;
  final IconData iconData;

  const SectionIconHeader({@required this.sectionName, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, color: Colors.teal, size: 30,),
          SizedBox(width: 30,),
          AutoSizeText(sectionName,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      fit: BoxFit.scaleDown,
    );
  }
}
