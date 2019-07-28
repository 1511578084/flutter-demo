import 'package:demo/model/listData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

enum Option { A, B, C }

enum Actions { cancel, confirm }

class MaterialCompDemo extends StatefulWidget {
  MaterialCompDemo({Key key}) : super(key: key);

  _MaterialCompDemoState createState() => _MaterialCompDemoState();
}

class _MaterialCompDemoState extends State<MaterialCompDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('materialdemo'),
        ),
        body: ListView(
          children: <Widget>[
            ListItem('floatingactionbutton', FloatingDemo()),
            ListItem('buttondemo', ButtonDemo()),
            ListItem('popupmenubutton', PopupDemo()),
            ListItem('formdemo', FormItemDemo()),
            ListItem('datepicker', DatePickerDemo()),
            ListItem('dialog', DialogDemo()),
            ListItem('bottomSheet', BottomSheetDemo()),
            ListItem('ExpansionDemo', ExpansionDemo()),
            ListItem('ClipDemo', ClipDemo()),
            ListItem('TableDemo', TableDemo()),
            ListItem('PaginatedTableDemo', PaginatedTableDemo()),
            ListItem('CardDemo', CardDemo()),
            ListItem('StepDemo', StepDemo()),
          ],
        ));
  }
}

class StepDemo extends StatefulWidget {
  StepDemo({Key key}) : super(key: key);

  _StepDemoState createState() => _StepDemoState();
}

class _StepDemoState extends State<StepDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
            ),
            child: Stepper(
              currentStep: _currentStep,
              onStepTapped: (int step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  _currentStep > 1 ? _currentStep = 0 : _currentStep += 1;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep == 0 ? _currentStep = 0 : _currentStep -= 1;
                });
              },
              steps: [
                Step(
                    isActive: _currentStep == 0,
                    title: Text('step1'),
                    content: Text('content1')),
                    Step(
                    isActive: _currentStep == 1,
                    title: Text('step1'),
                    content: Text('content1')),
                    Step(
                    isActive: _currentStep == 2,
                    title: Text('step1'),
                    content: Text('content1')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardDemo extends StatelessWidget {
  const CardDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: ListView(
        children: posts.map((item) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                  ),
                  title: Text(item.author),
                  subtitle: Text(item.title),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('like'),
                      onPressed: () {},
                      textColor: Colors.blue,
                    ),
                    FlatButton(
                      child: Text('read'),
                      onPressed: () {},
                      textColor: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PaginatedTableDemo extends StatefulWidget {
  PaginatedTableDemo({Key key}) : super(key: key);

  _PaginatedTableDemoState createState() => _PaginatedTableDemoState();
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;

  @override
  DataRow getRow(int index) {
    Post post = _posts[index];

    return DataRow.byIndex(
        index: index,
        selected: post.selected,
        onSelectChanged: (bool selected) {
          post.selected = selected;
          notifyListeners();
        },
        cells: [
          DataCell(Text(post.author)),
          DataCell(Text(post.title)),
          DataCell(Image.network(
            post.imageUrl,
            width: 100,
            height: 80,
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => 0;

  void _sort(asc) {
    _posts.sort((a, b) {
      if (asc) {
        return b.title.length.compareTo(a.title.length);
      } else {
        return a.title.length.compareTo(b.title.length);
      }
    });
    notifyListeners();
  }
}

class _PaginatedTableDemoState extends State<PaginatedTableDemo> {
  int _sortColumnIndex = 1;
  bool _sortAscending = false;

  PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedTableDemo'),
      ),
      body: ListView(children: <Widget>[
        PaginatedDataTable(
          header: Text('table title'),
          source: _postDataSource,
          rowsPerPage: 5,
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          dataRowHeight: 80,
          columns: [
            DataColumn(label: Text('author')),
            DataColumn(
                label: Text('title'),
                onSort: (int index, bool asc) {
                  _postDataSource._sort(asc);
                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = asc;
                  });
                }),
            DataColumn(label: Text('image')),
          ],
        ),
      ]),
    );
  }
}

class TableDemo extends StatefulWidget {
  TableDemo({Key key}) : super(key: key);

  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  int _sortColumnIndex = 1;
  bool _sortAscending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableDemo'),
      ),
      body: ListView(children: <Widget>[
        DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          dataRowHeight: 60,
          columns: [
            DataColumn(label: Text('author')),
            DataColumn(
                label: Text('title'),
                onSort: (int index, bool asc) {
                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = asc;
                    posts.sort((a, b) {
                      if (asc) {
                        return b.title.length.compareTo(a.title.length);
                      } else {
                        return a.title.length.compareTo(b.title.length);
                      }
                    });
                  });
                }),
            DataColumn(label: Text('image')),
          ],
          rows: posts.map((item) {
            return DataRow(
                cells: [
                  DataCell(Text(item.author)),
                  DataCell(Text(item.title)),
                  DataCell(Image.network(item.imageUrl)),
                ],
                selected: item.selected,
                onSelectChanged: (bool isSelected) {
                  setState(() {
                    item.selected = isSelected;
                  });
                });
          }).toList(),
        ),
      ]),
    );
  }
}

class ClipDemo extends StatefulWidget {
  ClipDemo({Key key}) : super(key: key);

  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  List<String> fruits = ['apple', 'banana', 'lemon'];

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 8.0,
            children: <Widget>[
              Chip(
                label: Text('apple'),
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://resources.ninghao.org/images/undo.jpg'),
                ),
              ),
              Chip(
                label: Text('banana'),
                backgroundColor: Colors.pink,
                avatar: CircleAvatar(
                  child: Text('龙'),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.red,
            indent: 18.0,
            endIndent: 18.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 18.0),
            width: double.infinity,
            child: Text(
              'delete chip',
              style: TextStyle(),
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: fruits.map((tag) {
              return Chip(
                onDeleted: () {
                  setState(() {
                    fruits.remove(tag);
                  });
                },
                label: Text(tag),
              );
            }).toList(),
          ),
          Divider(
            color: Colors.red,
            indent: 18.0,
            endIndent: 18.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 18.0),
            width: double.infinity,
            child: Text(
              'action chip',
              style: TextStyle(),
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: <Widget>[
              ActionChip(
                label: Text('apple'),
                onPressed: () {
                  debugPrint('apple');
                },
              ),
              FilterChip(
                label: Text('apple'),
                selected: _selected,
                onSelected: (selected) {
                  setState(() {
                    _selected = selected;
                  });
                },
              ),
              ChoiceChip(
                label: Text('apple'),
                selected: true,
                onSelected: (selected) {},
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            fruits = ['apple', 'banana', 'lemon'];
          });
        },
      ),
    );
  }
}

class ExpansionDemo extends StatefulWidget {
  ExpansionDemo({Key key}) : super(key: key);

  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionDemo> {
  bool _isExpend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isexpan) {
                setState(() {
                  _isExpend = !isexpan;
                });
                debugPrint('$index, $isexpan');
              },
              children: [
                ExpansionPanel(
                    isExpanded: _isExpend,
                    headerBuilder: (BuildContext context, isEx) {
                      return Text('expansion title');
                    },
                    body: Container(
                      child: Text('expansion body'),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final gb = GlobalKey<ScaffoldState>();
  String clickText = 'normal';

  _showBottomSheet() {
    gb.currentState.showBottomSheet((BuildContext context) {
      return Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('back'),
                      onPressed: () {
                        setState(() {
                          clickText = 'back';
                        });
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )),
        ],
      );
    });
  }

  Future<void> _showModalSheet() async {
    final clickVal = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.blue,
            height: 240,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });
    debugPrint(clickVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gb,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(clickText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('sheet'),
                onPressed: _showBottomSheet,
              ),
              OutlineButton(
                child: Text('modal sheet'),
                onPressed: _showModalSheet,
              ),
              SnackButton(),
            ],
          )
        ],
      ),
    );
  }
}

class SnackButton extends StatelessWidget {
  const SnackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('snackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('is processing'),
          action: SnackBarAction(
            label: 'bar',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
      },
    );
  }
}

class DialogDemo extends StatefulWidget {
  DialogDemo({Key key}) : super(key: key);

  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String chosedOpt = 'noting';

  _showAlertDialog() async {
    final chosed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('alert title'),
            content: Text('alert content!'),
            actions: <Widget>[
              FlatButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.pop(context, Actions.cancel);
                },
              ),
              FlatButton(
                child: Text('confirm'),
                onPressed: () {
                  Navigator.pop(context, Actions.confirm);
                },
              ),
            ],
          );
        });
    switch (chosed) {
      case Actions.cancel:
        setState(() {
          chosedOpt = 'cancel';
        });
        break;
      case Actions.confirm:
        setState(() {
          chosedOpt = 'confirm';
        });
        break;
    }
  }

  Future<void> _showDialog() async {
    final chosed = await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('simple dialog'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
                child: Text('option A'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
                child: Text('option B'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
                child: Text('option C'),
              ),
            ],
          );
        });
    switch (chosed) {
      case Option.A:
        setState(() {
          chosedOpt = 'A';
        });
        break;
      case Option.B:
        setState(() {
          chosedOpt = 'B';
        });
        break;
      case Option.C:
        setState(() {
          chosedOpt = 'C';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(chosedOpt),
          RaisedButton(
            onPressed: _showAlertDialog,
            child: Text('alert dialog'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _showDialog,
      ),
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  DatePickerDemo({Key key}) : super(key: key);

  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime dt = DateTime.now();
  TimeOfDay tt = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectDate() async {
    final DateTime chosedDt = await showDatePicker(
      context: context,
      initialDate: dt,
      firstDate: DateTime(1998),
      lastDate: DateTime(2020),
    );

    if (chosedDt == null) return;
    setState(() {
      dt = chosedDt;
    });
  }

  void _selectTime() async {
    final chosedTt = await showTimePicker(
      context: context,
      initialTime: tt,
    );

    if (chosedTt == null) return;
    setState(() {
      tt = chosedTt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePickerDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.purple,
            onTap: _selectDate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(DateFormat.yMMMd().format(dt)),
                Icon(Icons.arrow_downward),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.pink,
            highlightColor: Colors.blue,
            onTap: _selectTime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(tt.format(context)),
                Icon(Icons.arrow_downward),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FormItemDemo extends StatefulWidget {
  FormItemDemo({Key key}) : super(key: key);

  _FormItemDemoState createState() => _FormItemDemoState();
}

class _FormItemDemoState extends State<FormItemDemo> {
  bool _isChecked = false;
  int _groupV = 0;
  double _sliderV = 0;

  _onCheckboxChange(value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FormItemDemo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _isChecked,
              onChanged: _onCheckboxChange,
              title: Text('ok?'),
              subtitle: Text('This is ok?'),
              activeColor: Colors.black,
              secondary: Icon(Icons.add_alarm),
              selected: _isChecked,
            ),
            RadioListTile(
              onChanged: (v) {
                setState(() {
                  _groupV = v;
                });
              },
              value: 0,
              groupValue: _groupV,
              title: Text('ok?'),
              subtitle: Text('This is ok?'),
              activeColor: Colors.black,
              secondary: Icon(Icons.add_alarm),
              selected: _groupV == 0,
            ),
            SwitchListTile(
              value: _isChecked,
              onChanged: _onCheckboxChange,
              title: Text('ok?'),
              subtitle: Text('This is ok?'),
              activeColor: Colors.black,
              secondary: Icon(Icons.add_alarm),
              selected: _isChecked,
            ),
            Slider(
              value: _sliderV,
              onChanged: (v) {
                setState(() {
                  _sliderV = v;
                });
              },
              divisions: 5,
              min: 0,
              max: 10,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.withOpacity(0.3),
              label: '${_sliderV.toInt()}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: _onCheckboxChange,
                  activeColor: Theme.of(context).accentColor.withOpacity(0.5),
                ),
                Radio(
                  onChanged: (v) {
                    setState(() {
                      _groupV = v;
                    });
                  },
                  value: 0,
                  groupValue: _groupV,
                ),
                Radio(
                  onChanged: (v) {
                    setState(() {
                      _groupV = v;
                    });
                  },
                  value: 1,
                  groupValue: _groupV,
                ),
                Switch(
                  value: _isChecked,
                  onChanged: (v) {
                    setState(() {
                      _isChecked = v;
                    });
                  },
                )
              ],
            )
          ],
        ));
  }
}

class PopupDemo extends StatelessWidget {
  const PopupDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('popupbuttondemo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'apple',
                      child: Text('apple'),
                    ),
                    PopupMenuItem(
                      value: 'banana',
                      child: Text('banana'),
                    ),
                    PopupMenuItem(
                      value: 'pear',
                      child: Text('pear'),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flatbutton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('button'),
          onPressed: () {},
          splashColor: Colors.red,
          textColor: Colors.blue,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('add'),
          onPressed: () {},
          splashColor: Colors.red,
          textColor: Colors.blue,
        )
      ],
    );
    final raisedbutton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('ok'),
          textColor: Colors.blue,
          elevation: 0.0,
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('add'),
          onPressed: () {},
          textColor: Colors.blue,
        )
      ],
    );
    final outlinebutton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text('add'),
          onPressed: () {},
          shape: StadiumBorder(),
        ),
        SizedBox(
          width: 10,
        ),
        OutlineButton.icon(
          label: Text('add'),
          icon: Icon(Icons.add),
          onPressed: () {},
          shape: StadiumBorder(),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('buttonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatbutton,
            raisedbutton,
            outlinebutton,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 180,
                  child: OutlineButton(
                    child: Text('add'),
                    shape: StadiumBorder(),
                    onPressed: () {},
                    textColor: Colors.blue,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    child: Text('add'),
                    shape: StadiumBorder(),
                    onPressed: () {},
                    textColor: Colors.blue,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    child: Text('add'),
                    shape: StadiumBorder(),
                    onPressed: () {},
                    textColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: OutlineButton(
                    child: Text('add'),
                    shape: StadiumBorder(),
                    onPressed: () {},
                    textColor: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                        padding: EdgeInsets.symmetric(horizontal: 44.0)),
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('add'),
                        shape: StadiumBorder(),
                        onPressed: () {},
                        textColor: Colors.blue,
                      ),
                      OutlineButton(
                        child: Text('add'),
                        shape: StadiumBorder(),
                        onPressed: () {},
                        textColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FloatingDemo extends StatelessWidget {
  const FloatingDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final floatbutton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(0.0),
      // ),
    );
    final floatbuttonextend = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('ok'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('floatingactionbutton'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('ok'),
          ],
        ),
      ),
      floatingActionButton: floatbutton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.pink,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget widget;

  ListItem(this.title, this.widget, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => widget,
        ));
      },
    );
  }
}
