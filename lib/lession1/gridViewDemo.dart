import 'package:demo/model/listData.dart';
import 'package:flutter/material.dart';


class GridVewDemo extends StatelessWidget {
  const GridVewDemo({Key key}) : super(key: key);

  List<Widget> _buildTiles(length) {
    return List.generate(length, (int index) {
      return Container(
          alignment: Alignment.center,
          color: Colors.grey[100],
          child: Text('item $index'),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 20,
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }
}


class GridViewExtendDeo extends StatelessWidget {
  const GridViewExtendDeo({Key key}) : super(key: key);

  List<Widget> _buildTiles(length) {
    return List.generate(length, (int index) {
      return Container(
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: Text('item $index'),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: _buildTiles(100),
    );
  }
}


class GridViewuilderDemo extends StatelessWidget {
  const GridViewuilderDemo({Key key}) : super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    Post p = posts[index];

    return Container(
          color: Colors.grey[300],
          child: Image.network(p.imageUrl, fit: BoxFit.cover,),
        );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      )
    );
  }
}