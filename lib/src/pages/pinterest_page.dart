import 'package:disenos_app/src/widgets/pinteres_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
 
class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PinterestMenu(),
        ),
      ),
    );
  }
}
 
class PinterestGrid extends StatelessWidget {
  
  final List<int> items = List.generate(200, (index) => index);
 
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: [
          WovenGridTile(1),
          const WovenGridTile(
            0.6,
            crossAxisRatio: 0.85,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}
 
class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    required this.index,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}