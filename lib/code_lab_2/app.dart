import 'package:flutter/material.dart';
import 'src/screen/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          primaryColor: Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.red[400]
              : Colors.blue[400]),
    );
  }
}
