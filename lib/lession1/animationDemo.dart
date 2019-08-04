
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';


class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationHomeDemo(),
    );
  }
}

class AnimationHomeDemo extends StatefulWidget {
  AnimationHomeDemo({Key key}) : super(key: key);

  _AnimationHomeDemoState createState() => _AnimationHomeDemoState();
}

class _AnimationHomeDemoState extends State<AnimationHomeDemo> with TickerProviderStateMixin{
  AnimationController amc;
  Animation anm;
  Animation aColor;
  CurvedAnimation canm;

  @override
  void initState() {
    super.initState();
    amc = new AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(seconds: 1),
      vsync: this,
    );

    canm = CurvedAnimation(parent: amc, curve: Curves.bounceInOut);
    anm = Tween(begin: 32.0, end: 100.0).animate(canm);
    aColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(canm);
    // amc.addListener(() {
    //   setState(() {});
    // });

    // amc.addStatusListener((status) {
    //   print('$status');
    // });

  }

  @override
  void dispose() {
    super.dispose();
    amc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateHeart(amc: amc, amList: [anm, aColor]);
  }
}

class AnimateHeart extends AnimatedWidget {
  final AnimationController amc;
  final List<Animation> amList;

  AnimateHeart({
    this.amc,
    this.amList
  }):super(listenable: amc);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: amc.value,
        iconSize: amList[0].value,
        color: amList[1].value,
        onPressed: () {
          if (amc.status == AnimationStatus.completed) {
            amc.reverse();
          } else if (amc.status == AnimationStatus.dismissed) {
            amc.forward();
          }
        },
      ),
    );
  }

  

}