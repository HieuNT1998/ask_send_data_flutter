import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _dataFromFlutter = "Android can ping you";
  static const platform = const MethodChannel('AndySample/test');
  Future<void> _getDataFromAdnroid() async {
    String data;
    try {
      // final String result = await platform.invokeMethod(
      //     'bodoi', {"data": "Call me flutter"}); //sending data from flutter here
      
      final String results = await platform.invokeMethod(
          'bodoi');

      data = results;
    } on PlatformException catch (e) {
      data = "Android is not responding please check the code";
    }

    setState(() {
      _dataFromFlutter = data;
    });
  }

    Future<void> _getDataFromAdnroid2() async {
    String data;
    try {
      // final String result = await platform.invokeMethod(
      //     'bodoi', {"data": "Call me flutter"}); //sending data from flutter here
      
      final String results = await platform.invokeMethod(
          'test',{"data": "Call me flutter"});

      data = results;
    } on PlatformException catch (e) {
      data = "Android is not responding please check the code";
    }

    setState(() {
      _dataFromFlutter = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dataFromFlutter),
            RaisedButton(
              onPressed: () {
                _getDataFromAdnroid();
              },
              child: Text("Click button"),
            ),
             RaisedButton(
              onPressed: () {
                _getDataFromAdnroid2();
              },
              child: Text("Click button di"),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
