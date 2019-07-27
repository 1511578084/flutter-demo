import 'package:flutter/material.dart';


class FormDemo extends StatefulWidget {
  FormDemo({Key key}) : super(key: key);

  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.pink,
      ),
      child: Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormFiledDemo(),
        ],
      ),
    ),
    ),
    );
  }
}


class FormFiledDemo extends StatefulWidget {
  FormFiledDemo({Key key}) : super(key: key);

  _FormFiledDemoState createState() => _FormFiledDemoState();
}

class _FormFiledDemoState extends State<FormFiledDemo> {
final globalKey = GlobalKey<FormState>();
String username, password;

  onFormSubmit () {
    globalKey.currentState.save();
    globalKey.currentState.validate();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('is registing'),
      )
    );
    debugPrint('username $username, password: $password');
  }

  String validate( String val) {
    if (val.isEmpty) {
      return 'is required';
    }

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: 'please enter account',
              icon: Icon(Icons.verified_user),
            ),
            onSaved: (val) {
              username = val;
            },
            validator: validate,
            autovalidate: true,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'please enter password',
              icon: Icon(Icons.group_work),
            ),
            onSaved: (val) {
              password = val;
            },
            validator: validate,
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('submit'),
              onPressed: onFormSubmit,
            ),
          )
        ],
      ),
    );
  }
}

class TextFiledDemo extends StatefulWidget {
  TextFiledDemo({Key key}) : super(key: key);

  _TextFiledDemoState createState() => _TextFiledDemoState();
}

class _TextFiledDemoState extends State<TextFiledDemo> {
  TextEditingController textEditCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    // textEditCon.text = 'init val';
    textEditCon.addListener(() {
      debugPrint('clonter ${textEditCon.text}');
    });
  }

  @override
  void dispose() {
    textEditCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
            // onChanged: (val) => debugPrint(val),
            // onSubmitted: (val) => debugPrint('submit: $val'),
            controller: textEditCon,
            decoration: InputDecoration(
              hintText: 'please enter text',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              labelText: 'title',
              icon: Icon(Icons.text_fields)
            ),
            
    );
  }
}