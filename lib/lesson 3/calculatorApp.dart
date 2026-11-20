import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  double result = 0;
  String operation = '';

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF123C2B),
      appBar: AppBar(
        title: Text(
          'Money Calculator💸',
          style: TextStyle(
            color: Color(0xFFF5D77A),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF1D563D),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите первое число',
                labelStyle: TextStyle(
                  color: Color(0xFFD5B45B),
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Color(0xFFF5F0E2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD5B45B), width: 2),
                ),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите второе число',
                labelStyle: TextStyle(
                  color: Color(0xFFD5B45B),
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Color(0xFFF5F0E2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFD5B45B), width: 2),
                ),
              ),
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5B45B),
                    foregroundColor: Color(0xFF123C2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(65, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                      operation = '+';
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5B45B),
                    foregroundColor: Color(0xFF123C2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(65, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                      operation = '-';
                    });
                  },
                  child: Text('-', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5B45B),
                    foregroundColor: Color(0xFF123C2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(65, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      result = firstValue * secondValue;
                      operation = 'x';
                    });
                  },
                  child: Text('×', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5B45B),
                    foregroundColor: Color(0xFF123C2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(65, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      if (secondValue == 0) {
                        result = 0;
                      } else {
                        result = firstValue / secondValue;
                      }

                      operation = '÷';
                    });
                  },
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),

            SizedBox(height: 30),

            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF286346),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: resetCalculator,
                child: Text('↻ Сброс', style: TextStyle(fontSize: 18)),
              ),
            ),

            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFF1D563D),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFD5B45B), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'РЕЗУЛЬТАТ',
                    style: TextStyle(
                      color: Color(0xFFD5B45B),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${result.toStringAsFixed(2)} \$',
                    style: TextStyle(
                      color: Color(0xFFF5D77A),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '${firstValue} $operation ${secondValue} = ${result}',
                    style: TextStyle(color: Color(0xFFE6D9B5), fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
