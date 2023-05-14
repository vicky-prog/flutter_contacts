import 'package:flutter/material.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: CustomScrollView(
        slivers: [
            SliverAppBar(
            pinned: true,
            title: Text('Sticky Header' ?? ''),
          ),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
              minHeight: 50,
              maxHeight: 100,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Sticky Header'),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}


