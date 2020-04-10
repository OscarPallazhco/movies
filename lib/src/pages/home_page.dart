import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        centerTitle: false,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}
          )
        ],
      ),
      body: SafeArea(child: Text('HomePage')),
    );
  }
}
