import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpHomeDemo(),
    );
  }
}

class HttpHomeDemo extends StatefulWidget {
  HttpHomeDemo({Key key}) : super(key: key);

  _HttpHomeDemoState createState() => _HttpHomeDemoState();
}

class _HttpHomeDemoState extends State<HttpHomeDemo> {

  Future<List<Person>> fetchData() async {
    var resopnse = await http.get('http://127.0.0.1/a.json');
    var resBody = json.decode(resopnse.body);
    print(resBody);
    List<Person> posts = resBody['posts'].map<Person>((item) {
      return Person.fromJson(item);
    }).toList();
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snap) {
        if (snap.data == null) {
          return Center(
            child: Text('Loading...'),
          );
        }
        return ListView(
          children: snap.data.map<Widget>((p) {
            return ListTile(
              title: Text(p.name),
              subtitle: Text(p.title),
            );
          }).toList(),
        );
      },
    );
  }
}

class Person{
  String name;
  String title;

  Person(name, title);

  Person.fromJson(Map json): name = json['name'], title=json['title'];

}