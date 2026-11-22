import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Список Учеников'),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Text('Артур'),
            Text('Арсен'),
            Text('Родион'),
            Text('Баимбет'),
            Text('Канат'),
          ],
        ),
      ),
    );
  }
}
