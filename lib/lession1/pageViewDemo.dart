import 'package:flutter/material.dart';
import '../model/listData.dart';

class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({Key key}) : super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    Post p = posts[index];
    return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox.expand(
              child: Image.network(
                p.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 10,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(p.title),
                  Text(p.author),
                ],
              ),
            )
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      reverse: false,
      onPageChanged: (int currentPage) => debugPrint('$currentPage'),
      controller: PageController(
        initialPage: 1,
        keepPage: false,
        viewportFraction: 0.8,
      ),
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.grey[800],
          child: Text('one' ,style: TextStyle(color: Colors.white),),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.grey[500],
          child: Text('two'),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: Text('three'),
        ),
      ],
    );
  }
}