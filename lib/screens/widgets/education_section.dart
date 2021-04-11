import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reeno_website/utils/section_header.dart';

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(child: SectionHeader(sectionName: "Education",),),
                  schoolSummary("University of the Philippines Visayas - Tacloban College", "BS. Computer Science", "2009-2013", "Tacloban, Leyte", AssetImage('assets/images/upvtc.png')),
                  schoolSummary("Philippine Science High School - Easter Visayas Campus", null, "2005-2019", "Palo, Leyte", AssetImage('assets/images/pshs.png')),
                  schoolSummary("Cassidy Elementary School", null, "1999-2005", "Carigara, Leyte", AssetImage('assets/images/cassidy.png')),
                  Divider(thickness: 2, color: Colors.white70, indent: 50, endIndent: 50, height: 20,),
                  Center(child: SectionHeader(sectionName: "Trainings",),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget schoolSummary(String schoolName, String course, String academicYears, String schoolAddress, AssetImage assetImage) {
  return Container(
    height: 120,
    width: 300,
    padding: EdgeInsets.all(20),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: assetImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(schoolName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                  fontSize: 20,
                ),
                maxFontSize: 24,
                minFontSize: 6,
              ),
              course == null ? SizedBox(height: 0,) :
              AutoSizeText(course,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 12,
                  color: Colors.teal,
                ),
                maxFontSize: 20,
                minFontSize: 6,
              ),
              AutoSizeText(academicYears,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontSize: 16,
                  color: Colors.white54,
                ),
                maxFontSize: 12,
                minFontSize: 6,
              ),
              AutoSizeText(schoolAddress,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  // fontSize: 16,
                  color: Colors.white54,
                ),
                maxFontSize: 12,
                minFontSize: 6,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}