import 'package:flutter/material.dart';

class ItemInfoPage extends StatelessWidget {
  final String name;

  const ItemInfoPage({Key key, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detailed information'),
      ),
      body: Container(
        child: Center(
          child: Text(name, style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
