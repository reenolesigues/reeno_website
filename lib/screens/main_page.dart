import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdf/pdf.dart';
import 'package:reeno_website/screens/widgets/achievement_section.dart';
import 'package:reeno_website/screens/widgets/education_section.dart';
import 'package:reeno_website/screens/widgets/general_section.dart';
import 'package:reeno_website/screens/widgets/project_section.dart';
import 'package:reeno_website/screens/widgets/work_section.dart';
import 'dart:js' as js;
import 'package:pdf/widgets.dart' as pw;
import 'package:reeno_website/widgets/custom_alert.dart';
import 'package:universal_html/html.dart' as html;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ResumeLayout(),
    );
  }
}

class ResumeLayout extends StatefulWidget {
  @override
  _ResumeLayoutState createState() => _ResumeLayoutState();
}

class _ResumeLayoutState extends State<ResumeLayout> {
  int resumeSection = 0;

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          );
        }));
    final bytes = pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 10, 10, MediaQuery.of(context).size.width / 10, 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/blackdrop03.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          color: Colors.teal,
                          child: IconButton(
                            color: Colors.white70,
                            onPressed: () => setState( () {resumeSection = 0;}),
                            icon: Icon(Icons.menu),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 0 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 0;}), icon: Icon(Ionicons.md_person)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 1 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 1;}), icon: Icon(Ionicons.md_school)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 2 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 2;}), icon: Icon(MaterialIcons.work)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 3 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 3;}), icon: Icon(Ionicons.md_medal)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 4 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 4;}), icon: Icon(MaterialCommunityIcons.folder_multiple)),),
                        ],
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: IconButton(
                          color: Colors.white70,
                          icon: Icon(Icons.cloud_download),
                          onPressed: () {
                            noteAlertD(context, "Function disabled at the moment.");
                            // final url = html.Url.createObjectUrlFromBlob(blob);
                            // final anchor =
                            // html.document.createElement('a') as html.AnchorElement
                            //   ..href = url
                            //   ..style.display = 'none'
                            //   ..download = 'some_name.pdf';
                            // html.document.body.children.add(anchor);
                            // anchor.click();
                            // html.document.body.children.remove(anchor);
                            // html.Url.revokeObjectUrl(url);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/coldreeno.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText("Reeno Lesigues",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      minFontSize: 5,
                      maxFontSize: 50,
                    ),
                    Divider(height: 10,),
                    AutoSizeText("Developer | Architect",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[400],
                      ),
                      maxLines: 1,
                      minFontSize: 5,
                    ),
                    Divider(height: 10,),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () => js.context.callMethod('open', ['https://www.linkedin.com/in/reenolesigues/']), icon: Icon(FontAwesome.linkedin_square, color: Colors.white)),
                          IconButton(onPressed: () => js.context.callMethod('open', ['https://www.github.com/reenolesigues']), icon: Icon(FontAwesome.github_square, color: Colors.white)),
                          IconButton(onPressed: () => js.context.callMethod('open', ['https://www.facebook.com/reenoforever']), icon: Icon(FontAwesome.facebook_square, color: Colors.white,)),
                          IconButton(onPressed: () => js.context.callMethod('open', ['https://www.twitter.com/reenoforever']), icon: Icon(FontAwesome.twitter_square, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 8,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Container(
                  color: Colors.white10,
                  child: resumeSection == 0 ? GeneralSection() :
                  resumeSection == 1 ? EducationSection():
                  resumeSection == 2 ? WorkSection():
                  resumeSection == 3 ? AchievementSection() : ProjectSection(),
                ),
              ),
              flex: 16,
            ),
          ],
        ),
      ),
    );
  }
}
