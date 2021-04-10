import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reeno_website/screens/widgets/achievement_section.dart';
import 'package:reeno_website/screens/widgets/education_section.dart';
import 'package:reeno_website/screens/widgets/general_section.dart';
import 'package:reeno_website/screens/widgets/project_section.dart';
import 'package:reeno_website/screens/widgets/work_section.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 10, 10, MediaQuery.of(context).size.width / 10, 10),
      color: Colors.black,
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
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 0 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 0;}), icon: Icon(Icons.person)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 1 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 1;}), icon: Icon(Icons.school)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 2 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 2;}), icon: Icon(Icons.work)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 3 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 3;}), icon: Icon(Icons.attractions)),),
                          FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: resumeSection == 4 ? Colors.tealAccent : Colors.white10, onPressed: () => setState( () {resumeSection = 4;}), icon: Icon(Icons.assignment)),),
                        ],
                      ),
                      FittedBox(fit: BoxFit.scaleDown, child: IconButton(color: Colors.white70, onPressed: () => setState( () {resumeSection = 0;}), icon: Icon(Icons.cloud_download)),),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/me_gray.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterLogo(),
                          FlutterLogo(),
                          FlutterLogo(),
                        ],
                      ),
                    ],
                  ),
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
