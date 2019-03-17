import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWords();
  }
}

class RandomWords extends State<Home> {
  // list of favorite word
  final Set<WordPair> _saved = Set<WordPair>();
  // a list that would contain Wordpair
  final List<WordPair> _suggestions = <WordPair>[];
  //textstyle
  TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return _buildSuggestion();
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        // add divider to odd index
        if (index.isOdd) {
          return Divider();
        }
        final int i = index ~/ 2;
        if (i >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[i]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool _alreadySaved = _saved.contains(pair);
    return ListTile(
        onTap: () {
          setState(() {
            if (_alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: _alreadySaved ? Colors.red[500] : null));
  }
}
