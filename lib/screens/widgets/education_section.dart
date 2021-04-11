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
                  Divider(thickness: 2, color: Colors.white70, indent: 50, endIndent: 50, height: 50,),
                  Center(child: SectionHeader(sectionName: "Trainings",),),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                schoolSummary("University of the Philippines Visayas - Tacloban College", "BS. Computer Science", "2009-2013", "Tacloban, Leyte", AssetImage('assets/images/upvtc.png')),
                schoolSummary("Philippine Science High School - Easter Visayas Campus", null, "2005-2019", "Palo, Leyte", AssetImage('assets/images/pshs.png')),
                schoolSummary("University of the Philippines Visayas - Tacloban College", "BS. Computer Science", "2009-2013", "Tacloban, Leyte", AssetImage('assets/images/upvtc.png')),
                schoolSummary("Philippine Science High School - Easter Visayas Campus", null, "2005-2019", "Palo, Leyte", AssetImage('assets/images/pshs.png')),
                schoolSummary("University of the Philippines Visayas - Tacloban College", "BS. Computer Science", "2009-2013", "Tacloban, Leyte", AssetImage('assets/images/upvtc.png')),
                schoolSummary("Philippine Science High School - Easter Visayas Campus", null, "2005-2019", "Palo, Leyte", AssetImage('assets/images/pshs.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget schoolSummary(String schoolName, String course, String academicYears, String schoolAddress, AssetImage assetImage) {
  return Align(
    alignment: Alignment.centerLeft,
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: assetImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(schoolName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                  maxFontSize: 24,
                  minFontSize: 6,
                ),
                course == null ? SizedBox(height: 0,) :
                AutoSizeText(course,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white54,
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
    ),
  );
}