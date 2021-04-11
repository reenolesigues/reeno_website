import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;

  const SectionHeader({@required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(sectionName,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
