import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InventoryPage(),
    )
);



class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Inventory')),
      body: Center(
        child: Text(
          'This is a Inventory Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}