import 'package:flutter/material.dart';
import '../model/listData.dart';


class ScrollViewDemo extends StatelessWidget {
  const ScrollViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // pinned: true,
          floating: true,
          expandedHeight: 170,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('sub title'),
            background: Image.network('https://resources.ninghao.org/images/undo.jpg', fit: BoxFit.cover,),
          ),
        ),
        SliverSafeArea(
          sliver: SliverPadding(
            sliver: SliverGridDemo(),
            padding: EdgeInsets.all(10),
          ),
        ),
        SliverGridDemo(),
      ],
    ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,

          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            Post p = posts[index];
            return Container(
              color: Colors.grey[300],
              child: Image.network(p.imageUrl, fit: BoxFit.cover,),
            );
          },
          childCount: posts.length),
        );
  }
}