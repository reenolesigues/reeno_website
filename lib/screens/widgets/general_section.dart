import 'package:flutter/material.dart';
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
                  skillsetRenderer(context, Icons.ac_unit, "Solution Architecture", "Design software and infrastructures to support business growth and transformation, focusing on system integration, scalability, security and performance"),
                  skillsetRenderer(context, Icons.ac_unit, "Server-side Development", "Develop distributed backend services supporting critical business processes"),
                  skillsetRenderer(context, Icons.ac_unit, "Client-side Development", "Web and mobile development which interacts with customers and end-users"),
                  skillsetRenderer(context, Icons.ac_unit, "Vulnerability Assessment", "Identify security vulnerabilities based on OWASP application security verification standard"),
                  skillsetRenderer(context, Icons.ac_unit, "Research & Development", "Basically anything you can think of - i.e. VOIP, Service Mesh, AI, Cross-platform development tools"),
                  skillsetRenderer(context, Icons.ac_unit, "Project Management", "Only if necessary for project delivery (not everything we know how to do, we love to do)"),
                  skillsetRenderer(context, Icons.ac_unit, "Linux Administration", "Managing linux servers, setting up dependencies for various applications to deploy"),
                  skillsetRenderer(context, Icons.ac_unit, "DevOps", "Automating deployment pipelines using a variety of devops tools"),
                  skillsetRenderer(context, Icons.ac_unit, "Application Testing", "Manual testing, unit testing, SIT/SAT, Load/stress testing, you name it, I hate it"),
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
              Text("27 years old", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),),
              Text("    /   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic), ),
              Text("Philippines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),),
              Text("    /   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
              Text("Employed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal, fontStyle: FontStyle.italic),),
            ],
          ),
          SizedBox(height: 20,),
          Flexible(
            fit: FlexFit.loose,
            child: Text("Software-Solutions architect with over 3 years of experience in enterprise architecture and over 5 years of development experience primarily on distributed systems and microservices with some mobile, python and web development experiences on the side. Knowledgeable in handling all aspect of product delivery from requirement analysis, development, testing, dev-ops, vulnerability assessment, operations and support. Experienced building entire IT ecosystems on various infrastructures. ", style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
  );
}

Widget skillsetRenderer(BuildContext context, IconData icon, String skill, String summary) {
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
        FittedBox(fit: BoxFit.fitWidth, child: Icon(icon, color: Colors.white24, size: 40,),),
        Flexible(child: SizedBox(height: 10,),),
        FittedBox(fit: BoxFit.fitWidth, child: Text(skill, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),),
        Flexible(child: SizedBox(height: 10,),),
        Container(child: Text(summary, style: TextStyle(fontSize: 12, color: Colors.white54,), overflow: TextOverflow.ellipsis, maxLines: 7,),),
      ],
    ),
  );
}