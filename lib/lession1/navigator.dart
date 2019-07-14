import 'package:flutter/material.dart';

class NavigatorDemo extends StatefulWidget {
  NavigatorDemo({Key key}) : super(key: key);

  _NavigatorDemoState createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> {
  int _curentIndex = 1;
  void _onBottomTap(int index) {
    setState(() {
      _curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _curentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: _onBottomTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('history'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_location),
          title: Text('my_location'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.minimize),
          title: Text('minimize'),
        )
      ],
    );
  }
}