import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';


void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {


  List<BottomNavigationBarItem> _Bitems;

  int _Bindex = 0;
  @override
  void initState() {
    _Bitems = new List();
    _Bitems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.people), title: new Text('People')));
    _Bitems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.alarm), title: new Text('Alarm')));
    _Bitems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.weekend), title: new Text('Weekend')));
  }

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  void _showsnackbar() {
    _scaffoldstate.currentState
        .showSnackBar(new SnackBar(content: new Text('Test Snack bar')));
  }

  int _counter = 0;
  String _value = '';
  int _Rvalue1 = 0;
  int _Rvalue2 = 0;
  double _slidervalue1 = 0.0;
  double _slidervalue2 = 0.0;
  double _slidervalue3 = 0.0;
  String _Datevalue = '';

  void _onPressed() {
    setState(() {
      _counter++;
    });
  }

  Future _showalert(BuildContext context, String message) {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        ));
  }

  void _showdailog() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Dialog text'),
                new RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('Close'),
                )
              ],
            ),
          );
        });
  }

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _sub() {
    setState(() {
      _counter--;
    });
  }

  void _change(String value) {
    setState(() => _value = 'Change: ${value}');
  }

  void _submit(String value) {
    setState(() => _value = 'Submit: ${value}');
  }

  bool _value1 = false;
  bool _value2 = false;

  void _value1change(bool value) {
    setState(() {
      _value1 = value;
    });
  }

  void _value2change(bool value) {
    setState(() {
      _value2 = value;
    });
  }

  void _slidervaluechange1(double value) {
    setState(() {
      _slidervalue1 = value;
    });
  }

  void _slidervaluechange2(double value) {
    setState(() {
      _slidervalue2 = value;
    });
  }

  void _slidervaluechange3(double value) {
    setState(() {
      _slidervalue3 = value;
    });
  }

  Future _selectdate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2020));
    if (picked != null) setState(() => _Datevalue = picked.toString());
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        title: new Text('App Title'),
        centerTitle: true,
        toolbarOpacity: 1.0,
          iconTheme: new IconThemeData(color: Colors.red,opacity: 0.5,size: 50),
         brightness: Brightness.light  ,
          backgroundColor: Colors.blue,
       // elevation: 0.7,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _sub)
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _selectdate,
        backgroundColor: Colors.deepPurple,
        child: new Icon(Icons.access_time),
        tooltip: 'Set Current Time',
      ),
      drawer: new Drawer(
        child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
                new Text('Drawer Text'),
                new RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: new Text('Close'))
              ],
            )),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.add), onPressed: _add),
        new IconButton(icon: new Icon(Icons.remove), onPressed: _sub),
        new IconButton(
            icon: new Icon(Icons.add_alert),
            onPressed: () => _showalert(context, 'Show alter test message'))
      ],
      body: SingleChildScrollView(
        child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text(_value),
                  new Text(
                    'Value is: ${_counter.toString()}',
                    style: TextStyle(fontSize: 21.0),
                  ),
                  new Card(
                      child: new Container(
                          padding: new EdgeInsets.all(32.0),
                          child: new Column(children: <Widget>[
                            new Image.asset('images/saplogo.png')
                          ]))),
                  new Card(
                      child: new Container(
                          padding: new EdgeInsets.all(32.0),
                          child: new Column(children: <Widget>[
                            new TextField(
                              decoration: new InputDecoration(
                                  labelText: 'Input Text here',
                                  hintText: 'Sample Hint',
                                  icon: new Icon(Icons.people)),
                              autocorrect: true,
                              keyboardType: TextInputType.datetime,
                              onChanged: _change,
                              onSubmitted: _submit,
                            ),
                            new Checkbox(
                                value: _value1, onChanged: _value1change),
                            new CheckboxListTile(
                              value: _value2,
                              onChanged: _value2change,
                              title: new Text('CheckBox'),
                              controlAffinity: ListTileControlAffinity.leading,
                              subtitle: new Text('CheckBox Subtitle'),
                              secondary: new Icon(Icons.file_download),
                              activeColor: Colors.green,
                            ),
                            new Switch(
                                value: _value1, onChanged: _value1change),
                            new SwitchListTile(
                              value: _value2,
                              onChanged: _value2change,
                              title: new Text('Switch Text',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                            ),
                          ]))),
                  new Card(
                      child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'RGB Value ${_slidervalue1.round()},${_slidervalue2.round()},${_slidervalue3.round()} ',
                          style: new TextStyle(
                              color: Color.fromARGB(
                                  255,
                                  _slidervalue1.round(),
                                  _slidervalue2.round(),
                                  _slidervalue3.round())),
                        ),
                        new Slider(
                            value: _slidervalue1,
                            onChanged: _slidervaluechange1,
                            activeColor: Colors.red,
                            max: 255.0),
                        new Slider(
                            value: _slidervalue2,
                            onChanged: _slidervaluechange2,
                            activeColor: Colors.green,
                            max: 255.0),
                        new Slider(
                            value: _slidervalue3,
                            onChanged: _slidervaluechange3,
                            activeColor: Colors.blue,
                            max: 255.0),
                      ],
                    ),
                  )),
                  new Card(
                      child: new Container(
                          padding: new EdgeInsets.all(32.0),
                          child: new Column(children: <Widget>[
                            new Text(_Datevalue),
                            new RaisedButton(
                                onPressed: _selectdate,
                                child: new Text('Click me to select date')),
                            new RaisedButton(
                                onPressed: _onPressed,
                                child: new Text('Click me')),
                            new RaisedButton(
                                onPressed: _showdailog,
                                child: new Text('show dialog')),
                            new FlatButton(
                                onPressed: _showsnackbar,
                                child: new Text('show snack bar')),
                            new IconButton(
                                icon: new Icon(Icons.add), onPressed: _add),
                            new IconButton(
                                icon: new Icon(Icons.remove), onPressed: _sub)
                          ]))),

                ],
              ),
            )),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: _Bitems,
          fixedColor: Colors.orange,
          currentIndex: _Bindex,
          onTap: (int item) {
            setState(() {
              _Bindex = item;
              _value = 'Select NavButton is: ${_Bindex}';
            });
          }),
    );
  }
}
