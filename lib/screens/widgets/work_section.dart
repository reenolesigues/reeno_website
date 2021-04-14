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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SectionIconHeader(sectionName: "Work", iconData: Icons.hourglass_bottom),
                        jobRenderer(AssetImage('assets/images/hcph.png'), "Homecredit Philippines", "BGC, Taguig", "2017 - present", "Solutions Architect", ["archi"]),
                        jobRenderer(AssetImage('assets/images/paymaya.png'), "Paymaya Philippines", "Pioneer, Mandaluyong", "2015 - 2017", "Software Engineer", ["archi"]),
                        jobRenderer(AssetImage('assets/images/samsung.png'), "Samsung R&D Center Philippines", "McKinley Hill, Taguig", "2013 - 2015", "R&D Engineer", ["archi"]),
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        FlutterLogo(),
                        FlutterLogo(),
                        FlutterLogo(),
                        FlutterLogo(),
                      ],
                    ),
                  ),
                  flex: 3,
                ),
              ],
            ) ,
          )
        ),
    );
  }
}

Widget jobRenderer(AssetImage assetImage, String company, String address, String dateRange, String position, List<String> roles) {
  return Container(
    height: 300,
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
          child: Container(
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
        ),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(company,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // FittedBox(fit: BoxFit.fitWidth, child: Text(skill, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),),
        Flexible(child: SizedBox(height: 10,),),
        AutoSizeText(position,
          style: TextStyle(fontSize: 12, color: Colors.white54,),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}