import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ModelDemo extends StatelessWidget {
  const ModelDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ModelDemo'),
        ),
        body: Center(
          child: Couter(),
        ),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, child, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              model.counterCallback();
            },
          ),
        ),
      ),
    );
  }
}

class Couter extends StatelessWidget {
  const Couter({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
          builder: (context, child, model) => ActionChip(
            label: Text('${model.count}'),
            onPressed: model.counterCallback,
          ));
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void counterCallback() {
    print('1');
    _count++;
    notifyListeners();
  }
}
