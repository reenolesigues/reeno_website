import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
                  SizedBox(height: 20,),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                trainingSummary("Azure Fundamentals", "Introductory course on Azure cloud platform", "February 2021", "Microsoft CZ", MaterialCommunityIcons.microsoft),
                trainingSummary("AWS Technical Essentials", "In depth training on AWS services and offerings", "February 2020", "BGC, Taguig", MaterialCommunityIcons.aws),
                trainingSummary("AWS Business Essentials", "Benefits in using cloud", "February 2020", "BGC, Taguig", MaterialCommunityIcons.aws),
                trainingSummary("7 Habits of Highly Effective People", "Approach to being effective in attaining goals by aligning oneself to what he calls 'true north' principles based on a character ethic", "October 2019", "BGC, Taguig", MaterialIcons.nature_people),
                trainingSummary("OpenApi", "OpenAPI (enterprise API hub) development training", "April 2019", "Prague, Czech Republic", FontAwesome5Brands.connectdevelop),
                trainingSummary("Advance Linux", "Basic to advance linux operating system management training", "February 2015", "BGC, Taguig", FontAwesome.linux),
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

Widget trainingSummary(String training, String overview, String date, String location, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white10,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(fit: BoxFit.scaleDown, child: Icon(icon, color: Colors.white24, size: 40,),),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(training,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // FittedBox(fit: BoxFit.fitWidth, child: Text(skill, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(date,
          style: TextStyle(fontSize: 12, color: Colors.white54,),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(location,
          style: TextStyle(fontSize: 12, color: Colors.white54, fontStyle: FontStyle.italic),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(overview,
          style: TextStyle(fontSize: 12, color: Colors.white54,),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    ),
  );
}
