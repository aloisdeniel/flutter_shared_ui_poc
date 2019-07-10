import 'package:flutter_stub/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.html) 'package:flutter_web/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'You have pushed the button this many times: $_counter',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text("+"),
      ),
    );
  }
}
