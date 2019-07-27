import 'package:demo/model/listData.dart';
import 'package:flutter/material.dart';


class DetailDemo extends StatelessWidget {
  final Post post;
  const DetailDemo(@required this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl, fit: BoxFit.cover,),
          Text(post.author),
          Text(post.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}