import 'package:flutter/material.dart';
import 'src/screen/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Code Lab 1'),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 1,
        ),
        body: Home(),
      ),
    );
  }
}
