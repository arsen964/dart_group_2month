import 'package:flutter/material.dart';

class FeedBackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FeedbackPage());
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String name = "";
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Обратная связь'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            // Stateless часть
            Text(
              'Форма обратной связи',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              'Введите своё имя и нажмите кнопку отправить.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 25),

            // Stateful часть
            TextField(
              decoration: InputDecoration(
                labelText: 'Ваше имя',
                border: OutlineInputBorder(),
              ),

              onChanged: (value) {
                setState(() {
                  name = value;
                  isSent = false;
                });
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (name.trim().isEmpty) {
                  return;
                }

                setState(() {
                  isSent = true;
                });
              },
              child: Text('Отправить'),
            ),

            SizedBox(height: 20),

            // Показываем только после отправки
            if (isSent)
              Text(
                'Отправлено! Спасибо, $name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
