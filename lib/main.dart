import 'package:demo/lession1/abort.dart';
import 'package:demo/lession1/formDemo.dart';
import 'package:demo/lession1/materialCompDemo.dart';
import 'package:flutter/material.dart';
import 'lession1/list-view.dart';
import 'lession1/navigator.dart';
import 'lession1/basicDemo.dart';
import 'lession1/layoutDemo.dart';
import 'lession1/pageViewDemo.dart';
import 'lession1/gridViewDemo.dart';
import 'lession1/customScrollViewDemo.dart';

void main() => runApp(App());

 class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      initialRoute: '/material',
      routes: {
        '/': (context) => Home(),
        '/abort': (context) => AbortDemo(),
        '/form': (context) => FormDemo(),
        '/material': (context) => MaterialCompDemo(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Colors.lightBlue,
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
      appBar: AppBar(
       
        title: Text('lession1'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: 'more button',
            icon: Icon(Icons.more_vert),
            onPressed: () => debugPrint('more click'),
          )
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white70,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.pink,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.text_fields),),
            Tab(icon: Icon(Icons.history),),
            Tab(icon: Icon(Icons.directions_bike),),
            Tab(icon: Icon(Icons.expand_more),),
            Tab(icon: Icon(Icons.extension),)
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ListViewDemo(),
          BasicDemo(),
          LayoutDemo(),
          PageViewBuilderDemo(),
          // GridVewDemo(),
          // GridViewExtendDeo(),
          // GridViewuilderDemo(),
          ScrollViewDemo()
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('header'),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('meesgae'),
                onTap: () => {
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('favorite'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('settings'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigatorDemo(),
    ),
    );
  }
}




