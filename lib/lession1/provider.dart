import 'package:flutter/material.dart';

class StateDemo extends StatelessWidget {
  const StateDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateDemo'),
      ),
      body: StateWrapper(),
    );
  }
}

class StateWrapper extends StatefulWidget {
  StateWrapper({Key key}) : super(key: key);

  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  int _count = 0;
  void _countCallback() {
    setState(() {
      _count+= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      countCallback: _countCallback,
      child: Center(
        child: Couter(),
      ),
    );
  }
}

class Couter extends StatelessWidget {
  
  const Couter({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int _count = CounterProvider.of(context).count;
    final VoidCallback _couteCallback = CounterProvider.of(context).countCallback;


    return ActionChip(
      label: Text('$_count'),
      onPressed: _couteCallback,
    );
  }
}


class CounterProvider extends InheritedWidget {

  final int count;
  final VoidCallback countCallback;
  final Widget child;

  CounterProvider(
    {
      this.count,
      this.countCallback,
      this.child
    }
  ):super(child: child);

  static CounterProvider of(BuildContext context) => 
  context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
  
}
