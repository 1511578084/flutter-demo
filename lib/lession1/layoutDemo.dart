import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        SizedBox(
          width: 300,
          height: 300,
          child: Container(
            alignment: Alignment(-1.0, -1.0),
            color: Color.fromRGBO(0, 0, 200, 1.0),
            child:  Icon(Icons.menu, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Icon(Icons.people)
        ),
        // AspectRatio(
        //     aspectRatio: 2.0/1.0,
        //     child: Container(
        //       color: Colors.green,
        //       child: Icon(Icons.pool),
        //     ),
        // ),
        Positioned(
          top: 0,
          left: 0,
          width: 100,
          height: 100,
          child: Icon(Icons.airline_seat_flat_angled),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 100,
              maxWidth: 100,
            ),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.red,
              child: Icon(Icons.perm_camera_mic),
            ),
          ),
        )
      ],
    );
  }
}

class MyIcon extends StatelessWidget {
  final IconData icon ;
  final double size;

  MyIcon(this.icon, {
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, color: Colors.white,),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(10, 30, 255, 1.0),
    );
  }
}