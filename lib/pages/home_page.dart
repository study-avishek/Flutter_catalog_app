import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int data = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Avisheks First App $data"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
