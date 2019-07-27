import 'package:demo/lession1/detail.dart';
import 'package:flutter/material.dart';
import '../model/listData.dart';

class ListViewDemo extends StatelessWidget {

  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    Post p = posts[index];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(p.imageUrl, fit: BoxFit.cover,),
              ),
              SizedBox(height: 10,),
              Text(p.title),
              SizedBox(height: 10,),
              Text(p.author),
            ],
          ),
          Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white10,
                    highlightColor: Colors.white60,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailDemo(posts[index]),
                        )
                      );
                    },
                  ),
                ),
              )
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