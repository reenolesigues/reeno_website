import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math' as math;

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
            color: Color(0xFF151026),
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(headerText, style: TextStyle(fontSize: 20, color: Colors.white54)),
              ),
            )
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
                  Container(color: Colors.cyan, height: 150.0),
                  Container(color: Colors.indigo, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                ],
              ),
            ),
            makeHeader('Mobile Application'),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [
                  projectRenderer(AssetImage('assets/images/wryvault.png'),
                      "Wry Vault", "10/2020",
                      "Password manager with no ads and fully works offline with online backup online capability (sort of)"),
                  projectRenderer(AssetImage('assets/images/wryvault.png'),
                      "Wry Vault", "10/2020",
                      "Password manager with no ads and fully works offline with online backup online capability (sort of)"),
                  projectRenderer(AssetImage('assets/images/wryvault.png'),
                      "Wry Vault", "10/2020",
                      "Password manager with no ads and fully works offline with online backup online capability (sort of)"),
                ],
              ),
            ),
            makeHeader('Microservices'),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(color: Colors.red, height: 1000.0, width: 300.0,),
                        Container(color: Colors.black38, height: 1000.0, width: 300.0,),
                        Container(color: Colors.green, height: 1000.0, width: 300.0,),
                      ],
                    );
                  },
                ),
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