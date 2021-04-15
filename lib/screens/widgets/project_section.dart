import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reeno_website/utils/section_header.dart';
import 'package:reeno_website/utils/section_icon_header.dart';

class ProjectSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SectionIconHeader(sectionName: "Personal Projects", iconData: Icons.hourglass_bottom),
                        SizedBox(height: 20,),
                        projectRenderer(AssetImage('assets/images/wryvault.png'),
                            "Wry Vault", "10/2020",
                            "Password manager with no ads and fully works offline with online backup online capability (sort of)"),
                        SizedBox(height: 20,),
                        projectRenderer(AssetImage('assets/images/mycnvs.png'),
                            "MyCNVS", "09/2020",
                            "Covid19 freeware application for CNVS module/item delivery using QR confiramtion"),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ) ,
          )
      ),
    );
  }
}

Widget projectRenderer(AssetImage assetImage, String project, String dateRange, String overview) {
  return Container(
    height: 200,
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
                  AutoSizeText(project,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(dateRange,
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
        AutoSizeText(overview,
          style: TextStyle(fontSize: 12, color: Colors.white54,),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}