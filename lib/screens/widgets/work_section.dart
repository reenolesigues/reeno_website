import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reeno_website/utils/section_header.dart';
import 'package:reeno_website/utils/section_icon_header.dart';

class WorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  SectionIconHeader(sectionName: "Work", iconData: Icons.hourglass_bottom),
                  SizedBox(height: 20,),
                  jobRenderer(
                      AssetImage('assets/images/hcph.png'),
                      "Homecredit Philippines", "BGC, Taguig",
                      "2017 - present ",
                      "Solutions Architect",
                      ["Governance of the Enterprise Architecture",
                        "Collaborates with other Architects across the group (ASIA, EU) on technology standardization and technical decision making",
                        "Prepare architecture roadmaps for products, platforms and security/infrastructure design"]),
                  SizedBox(height: 20,),
                  jobRenderer(
                      AssetImage('assets/images/hcph.png'),
                      "Homecredit Philippines", "BGC, Taguig",
                      "12/2018 - 01/2021 · 2 yrs 2 mos",
                      "Software Architect",
                      ["Led various R&D initiatives to build the company's core technology stack and architecture board",
                        "Designed base architecture for core backend systems",
                        "Designed or reviewed solutions for all IT projects, assessing performance, security, reliability and business value"]),
                  SizedBox(height: 20,),
                  jobRenderer(
                      AssetImage('assets/images/hcph.png'),
                      "Homecredit Philippines", "BGC, Taguig",
                      "06/2017 - 12/2018 · 1 yr 7 mos",
                      "Senior Java Developer",
                      ["Developed company's core backend services which supported the increase in customers from thousands to millions",
                        "Performed functional, performance and security testing on developed systems",
                        "Acted as pioneer scrum master during the company's agile transformation, facilitating scrum activities and led a team of developers and testers"]),
                  SizedBox(height: 20,),
                  jobRenderer(AssetImage('assets/images/paymaya.png'),
                      "Paymaya Philippines",
                      "Pioneer, Mandaluyong",
                      "05/2015 - 06/2017  · 2 yrs 2 mos",
                      "Software Engineer",
                      ["Developed SmartPadala core backend system using spring framework",
                        "Conducted functional testing, load testing, penetration/security testing on developed services"]),
                  SizedBox(height: 20,),
                  jobRenderer(AssetImage('assets/images/samsung.png'),
                      "Samsung R&D Center Philippines",
                      "McKinley Hill, Taguig",
                      "07/2013 - 04/2015 · 1 yr 10 mos",
                      "R&D Engineer",
                      ["Performed modem kernel customizations for Android Samsung smartphones",
                        "Initiated R&D initiatives ranging from open source technologies like Tizen to VOIP proof of concepts",
                        "Collaborated with Australian telcos in testing Samsung smartphones network performance"]),
                ],
              ),
            ),
          )
        ),
    );
  }
}

Widget jobRenderer(AssetImage assetImage, String company, String address, String dateRange, String position, List<String> roles) {
  return Container(
    height: 200,
    width: 400,
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    image: assetImage,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(company,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(position,
                    style: TextStyle(fontSize: 12, color: Colors.white54,),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText( address + " | " + dateRange,
                    style: TextStyle(fontSize: 12, color: Colors.white54,),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        Flexible(child: SizedBox(height: 10,),),
        Flexible(child: SizedBox(height: 10,),),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: roles.map((role) => AutoSizeText("• " + role,
            maxLines: 4,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Colors.white54,
                fontSize: 12),
          )).toList(),
        ),

        // FittedBox(fit: BoxFit.fitWidth, child: Text(skill, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),),
        Flexible(child: SizedBox(height: 10,),),
      ],
    ),
  );
}
