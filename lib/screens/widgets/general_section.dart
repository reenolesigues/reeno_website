import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:reeno_website/utils/section_header.dart';

class GeneralSection extends StatelessWidget {
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
                    aboutMe(context),
                    Divider(thickness: 2, color: Colors.white70, indent: 50, endIndent: 50, height: 20,),
                    Container(
                      height: 50,
                      child: Center(
                        child: SectionHeader(sectionName: "Skill Set",),
                      ),
                    ),
                  ],
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  skillSetRenderer(context, MaterialCommunityIcons.brain, "Solution Architecture", "Design software and infrastructures to support business growth and transformation, focusing on system integration, scalability, security and performance"),
                  skillSetRenderer(context, Feather.server, "Server-side Development", "Develop distributed backend services supporting critical business processes"),
                  skillSetRenderer(context, FontAwesome.laptop, "Client-side Development", "Web and mobile development which interacts with customers and end-users"),
                  skillSetRenderer(context, MaterialIcons.security, "Vulnerability Assessment", "Identify security vulnerabilities based on OWASP application security verification standard"),
                  skillSetRenderer(context, Foundation.magnifying_glass, "Research & Development", "Basically anything you can think of - i.e. VOIP, Service Mesh, AI, Cross-platform development tools"),
                  skillSetRenderer(context, Foundation.projection_screen, "Project Management", "Only if necessary for project delivery (not everything we know how to do, we love to do)"),
                  skillSetRenderer(context, FontAwesome.linux, "Linux Administration", "Managing linux servers, setting up dependencies for various applications to deploy"),
                  skillSetRenderer(context, Feather.git_pull_request, "DevOps", "Automating deployment pipelines using a variety of devops tools"),
                  skillSetRenderer(context, MaterialCommunityIcons.ab_testing, "Application Testing", "Manual testing, unit testing, SIT/SAT, Load/stress testing, you name it, I hate it"),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

Widget aboutMe(BuildContext context) {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 200.0,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: SectionHeader(sectionName: "About Me",),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("27 years old",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              Text("    /   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic), ),
              AutoSizeText("Philippines",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              // Text("Philippines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),),
              Text("    /   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
              AutoSizeText("Employed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              // Text("Employed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),),
            ],
          ),
          SizedBox(height: 20,),
          AutoSizeText("Software-Solutions architect with over 3 years of experience in enterprise architecture and over 5 years of development experience primarily on distributed systems and microservices with some mobile, python and web development experiences on the side. Knowledgeable in handling all aspect of product delivery from requirement analysis, development, testing, dev-ops, vulnerability assessment, operations and support. Experienced building entire IT ecosystems on various infrastructures. ",
            maxLines: 4,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
  );
}

Widget skillSetRenderer(BuildContext context, IconData icon, String skill, String summary) {
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
        AutoSizeText(skill,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // FittedBox(fit: BoxFit.fitWidth, child: Text(skill, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(summary,
          style: TextStyle(fontSize: 12, color: Colors.white54,),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}