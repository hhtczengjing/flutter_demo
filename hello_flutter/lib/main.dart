import 'package:flutter/material.dart';
import 'package:hello_flutter/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new InfiniteListView(),
    );
  }
}