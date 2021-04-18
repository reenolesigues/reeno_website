import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math' as math;
import 'dart:js' as js;

import 'package:reeno_website/utils/section_icon_header.dart';

class ProjectSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CollapsingList();
  }
}

/*Reference: https://medium.com/flutter/slivers-demystified-6ff68ab0296f*/

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 100.0,
        child: Container(
          // color: Color(0xFF151026),
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(headerText, style: TextStyle(fontSize: 20, color: Colors.white54)),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
                colors: [
                  Color(0xFF151026),
                  Colors.teal,
                  Colors.teal,
                  Color(0xFF151026),
                ],
              )
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: SectionIconHeader(sectionName: "Projects", iconData: Icons.folder_open),
              pinned: true,
              centerTitle: true,
            ),
            makeHeader('Websites'),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  projectRenderer(AssetImage('assets/images/wryvault.png'),
                      "Reeno Website", "10/2020",
                      "My personal website",
                      "https://reenolesigues.github.io/"),
                ],
              ),
            ),
            makeHeader('Mobile Applications'),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [
                  projectRenderer(AssetImage('assets/images/wryvault.png'),
                    "Wry Vault", "10/2020",
                    "Password manager with no ads and fully works offline with online backup online capability (sort of)",
                    "https://play.google.com/store/apps/details?id=org.wry.wry_vault",
                  ),
                  projectRenderer(AssetImage('assets/images/mycnvs.png'),
                    "MyCNVS", "09/2020",
                    "QR based distribution of high school modules of Carigara National Vocational School",
                    "https://play.google.com/store/apps/details?id=org.cnvs.pruneproject"
                  ),
                ],
              ),
            ),
            makeHeader('Desktop Applications'),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  projectRenderer(AssetImage('assets/images/magdendro.png'),
                    "MAGDendro", "03/2013",
                    "Digital Tree Ring Dating using various Image Processing and Mathematical Morphology Algorithms",
                    "https://github.com/reenolesigues/MAGDendro"
                  ),
                ],
              ),
            ),
            /*Last Row for LinkedIn/FB connect*/
          ],
        ),
    );
  }
}

/*
projectRenderer(AssetImage('assets/images/wryvault.png'),
                            "Wry Vault", "10/2020",
                            "Password manager with no ads and fully works offline with online backup online capability (sort of)"),
 */
Widget projectRenderer(AssetImage assetImage, String project, String dateRange, String overview, String link) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white10,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        Row(
          children: [
            AutoSizeText("Link :",
              style: TextStyle( color: Colors.white54, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxFontSize: 14,
              minFontSize: 6,
            ),
            SizedBox(width: 10,),
            TextButton(
              onPressed: () => js.context.callMethod('open', [link]),
              child: AutoSizeText(link,
                style: TextStyle( color: Colors.blue,),
                overflow: TextOverflow.ellipsis,
                maxFontSize: 14,
                minFontSize: 6,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}