import 'package:flutter_cross/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp() as dynamic);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page') as dynamic, // Casted as dynamic
    );
  }
}