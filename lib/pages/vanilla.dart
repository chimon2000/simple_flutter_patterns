import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/patterns/vanilla.dart';

class VanillaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Vanilla pattern'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Post(),
      ),
    );
  }
}
