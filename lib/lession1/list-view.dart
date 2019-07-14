import 'package:flutter/material.dart';

import '../model/listData.dart';

class ListViewDemo extends StatelessWidget {

  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    Post p = posts[index];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.network(p.imageUrl),
          SizedBox(height: 10,),
          Text(p.title),
          SizedBox(height: 10,),
          Text(p.author),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 10,
          itemBuilder: _listItemBuilder,
    );
  }
}