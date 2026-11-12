import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  final String name = 'arseshbai';
  final String residence = 'I live in Bishkek';
  final String age = 'I am 15';
  final String bio = 'I am good at judo and swimming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171A1D),

      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF292E33),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/arsen.jpeg'),
            ),
            SizedBox(height: 16),

            Text(
              name,
              style: TextStyle(
                fontFamily: 'Oregano',
                fontSize: 22,
                color: Color(0xFFD6B878),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),

            Text(
              residence,
              style: TextStyle(
                fontFamily: 'Oregano',
                fontSize: 22,
                color: Color(0xFFAAB5BC),
              ),
            ),

            SizedBox(height: 4),

            Text(
              age,
              style: TextStyle(
                fontFamily: 'Oregano',
                fontSize: 22,
                color: Color(0xFFAAB5BC),
              ),
            ),
            SizedBox(height: 4),

            Text(
              bio,
              style: TextStyle(
                fontFamily: 'Oregano',
                fontSize: 22,
                color: Color(0xFFAAB5BC),
              ),
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  iconSize: 30,
                  color: Color(0xFFD6B878),
                ),

                SizedBox(width: 16),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                  iconSize: 30,
                  color: Color(0xFFD6B878),
                ),

                SizedBox(width: 16),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                  color: Color(0xFFD6B878),
                ),

                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD6B878),
              foregroundColor: Color(0xFF171A1D)
              ),
              child: Text('Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
