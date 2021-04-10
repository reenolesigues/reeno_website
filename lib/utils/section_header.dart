import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;

  const SectionHeader({@required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Text(sectionName,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    );
  }
}
