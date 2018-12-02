import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/detail.dart';
import 'package:flutter_hybrid_router/flutter_hybrid_router.dart';

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final FlutterHybridRouter router = new FlutterHybridRouter();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Hello World'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios), 
          onPressed: () {
            try {
              router.openURL(url: 'com.devzeng.demo://goback');
            } catch (e) {
              print(e);
            }
          },
        ),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        _pushToDetailPage();
      },
    );
  }

  _pushToDetailPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new DetailPage();
        },
      ),
    );
  }
}