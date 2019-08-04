import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  // Stream<String> _stream ;
  StreamSubscription _ssc;
  StreamController<String> _scl;
  StreamSink _scs;
  String _data = '...';

  @override
  void initState() {
    super.initState();
    // _stream = Stream.fromFuture(fetchData());
    // _ssc = _stream.listen(onData);
    _scl = new StreamController<String>();
    _scs = _scl.sink;
    _ssc = _scl.stream.listen(onData); //不能喝streamBuilder共存
  }

  void _addData()  async{
    String data = await fetchData();
    // _scl.add(data);
    _scs.add(data);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onData(String data) {
    setState(() {
      _data += data;
    });
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_data),
        // StreamBuilder(
        //   stream: _scl.stream,
        //   initialData: '...',
        //   builder: (context, snap) => Text('${snap.data}'),
        // ),
        Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('add'),
              onPressed: _addData,
            ),
            FlatButton(
              child: Text('pause'),
              onPressed: () {
                _ssc.pause();
              },
            ),
            FlatButton(
              child: Text('resume'),
              onPressed: () {
                _ssc.resume();
              },
            ),
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                _ssc.cancel();
              },
            ),
          ],
        )
      ],
    );
  }
}