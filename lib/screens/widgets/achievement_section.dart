import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:reeno_website/utils/section_icon_header.dart';

class AchievementSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CollapsingList();
  }
}

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
      child: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: SectionIconHeader(sectionName: "Certifications", iconData: Icons.folder_open),
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  centerTitle: true,
                ),
                makeHeader('Techincal'),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(color: Colors.cyan, height: 150.0),
                      Container(color: Colors.indigo, height: 150.0),
                      Container(color: Colors.blue, height: 150.0),
                    ],
                  ),
                ),
                makeHeader('Soft Skills'),
                SliverFixedExtentList(
                  itemExtent: 150.0,
                  delegate: SliverChildListDelegate(
                    [
                      Container(color: Colors.cyan, height: 150.0),
                      Container(color: Colors.indigo, height: 150.0),
                      Container(color: Colors.blue, height: 150.0),
                    ],
                  ),
                ),
                makeHeader('Company'),
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
            flex: 1,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: SectionIconHeader(sectionName: "Awards", iconData: Icons.folder_open),
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  centerTitle: true,
                ),
                makeHeader('Techincal'),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(color: Colors.cyan, height: 150.0),
                      Container(color: Colors.indigo, height: 150.0),
                      Container(color: Colors.blue, height: 150.0),
                    ],
                  ),
                ),
                makeHeader('Soft Skills'),
                SliverFixedExtentList(
                  itemExtent: 150.0,
                  delegate: SliverChildListDelegate(
                    [
                      Container(color: Colors.cyan, height: 150.0),
                      Container(color: Colors.indigo, height: 150.0),
                      Container(color: Colors.blue, height: 150.0),
                    ],
                  ),
                ),
                makeHeader('Company'),
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
            flex: 1,
          )
        ],
      ),
    );
  }
}