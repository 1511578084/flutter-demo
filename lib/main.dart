import 'package:flutter/material.dart';
import 'model/listData.dart';

void main() => runApp(App());

 class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
    );
  }
}

class Home extends StatelessWidget {

  const Home({Key key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('hello title'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: _listItemBuilder,
        )
      );
  }
}

class Hello extends StatelessWidget {
  const Hello({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40,
          color: Colors.yellow,
          decoration: TextDecoration.lineThrough,
        )
      ),
    ),
    );
  }
}