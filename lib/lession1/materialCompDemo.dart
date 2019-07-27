import 'package:flutter/material.dart';

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
          ListItem('popupmenubutton', PopupDemo())
        ],
      )
    );
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
      )
    );
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
                SizedBox(width: 10,),
                RaisedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  onPressed: () {},
                  textColor: Colors.blue,
                )
              ],
            );
    final outlinebutton =   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text('add'),
                  onPressed: () {},
                  shape: StadiumBorder(),
                ),
                SizedBox(width: 10,),
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
                SizedBox(width: 10,),
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
                      padding: EdgeInsets.symmetric(horizontal: 44.0)
                    ),
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
    final  floatbutton = FloatingActionButton(
      onPressed: () {

      },
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widget,
          )
        );
      },
    );
  }
}