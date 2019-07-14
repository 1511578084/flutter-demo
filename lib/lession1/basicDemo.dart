import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {

  const BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationDemo();
  }
}


class DecorationDemo extends StatelessWidget {
  const DecorationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          alignment: Alignment.topLeft,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.blue,
            BlendMode.plus,
          ),
          image: NetworkImage('https://resources.ninghao.org/images/candy-shop.jpg'),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                 color: Colors.green,
                  width: 6,
                  style: BorderStyle.solid,
              ),
              // borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3,3),
                  color: Colors.orange,
                  blurRadius: 10,
                  spreadRadius: 8,
                )
              ],
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.red,
                  Colors.purple,
                ]
              )
            ),
            child: Icon(Icons.pool, size: 60.0, color: Colors.blue,),
          )
        ],
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'hello',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 30.0,
        ),
        children: [
          TextSpan(
            text: '.com',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),

          )
        ],
      ),
    );
  }
}


class MyText extends StatelessWidget {
  final String author = 'yyl';

  const MyText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
            '${author}hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'simsun',
              color: Color.fromRGBO(20, 30, 40, 0.2),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}