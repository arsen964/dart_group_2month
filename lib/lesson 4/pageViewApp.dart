import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Пример Page View'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: PageView(
          children: [
            page('Welcome', Colors.deepOrange),
            page('Flutter', Colors.indigoAccent),
            page('Course', Colors.lightGreen),

          ],
        ),
      ),
    );
  }
}

Widget page(String text, Color color) {
  return Container(
    color: color,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
