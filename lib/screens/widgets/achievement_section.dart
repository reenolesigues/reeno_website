import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math' as math;
import 'package:reeno_website/utils/section_icon_header.dart';

class AchievementSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SectionIconHeader(sectionName: "Certifications", iconData: Icons.folder_open),
                    SizedBox(height: 40,),
                    renderCertification("Certified Lean Six Sigma Yellowbelt (CLSSYB)", "Nov 2020", "Six Sigma"),
                    SizedBox(height: 20,),
                    renderCertification("Certified Web Application Security Professional (CWASP)", "Feb 2020", "Network Intelligence"),
                    SizedBox(height: 20,),
                    renderCertification("Certified Payment Security Practitioner (CPSP)", "Feb 2020", "Network Intelligence"),
                    SizedBox(height: 20,),
                    renderCertification("Philippine National IT Standards", "April 2013", "Philippine National IT Standards"),
                  ],
                ),
              ),
              Divider(thickness: 2, color: Colors.white70, indent: 200, endIndent: 200, height: 50,),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SectionIconHeader(sectionName: "Awards", iconData: Entypo.trophy),
                    SizedBox(height: 40,),
                    renderCertification("Homecredit Global No-Glitch Hackathon - Grand Champion", "April 2021", "Home Credit International"),
                    SizedBox(height: 20,),
                    renderCertification("F.I.R.E. Awardee", "October 2019", "Homecredit Philippines"),
                    SizedBox(height: 20,),
                    renderCertification("Jjang Awardee", "September 2014", "Samsung R&D Philippines"),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget renderCertification(String certification, String date, String provider) {
  return Container(
    height: 100,
    width: 500,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white10,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(certification,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          softWrap: true,
          minFontSize: 6,
          maxFontSize: 16,
        ),
        AutoSizeText(date,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          minFontSize: 6,
          maxFontSize: 12,
        ),
        AutoSizeText(provider,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: Colors.white),
          minFontSize: 6,
          maxFontSize: 12,
        ),
      ],
    ),
  );
}