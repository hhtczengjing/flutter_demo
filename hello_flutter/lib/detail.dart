import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new _DetailPageState();
    }
}

class _DetailPageState extends State<DetailPage> {
  @override
    Widget build(BuildContext context) {
      return new WebviewScaffold(
        url: "https://www.baidu.com",
        appBar: new AppBar(
          title: new Text("Flutter Webview"),
        ),
      );
    }
}