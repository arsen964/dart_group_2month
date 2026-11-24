import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Map<String, List<Map<String, dynamic>>> productByCategory = {
    'Мониторы': [
      {
        'name': 'Монитор Xiaomi',
        'price': 19900,
        'icon': Icons.monitor,
        'color': Colors.deepPurple,
      },
      {
        'name': 'Монитор DEXP',
        'price': 12900,
        'icon': Icons.monitor,
        'color': Colors.blue,
      },
      {
        'name': 'Монитор Acer',
        'price': 14900,
        'icon': Icons.monitor,
        'color': Colors.green,
      },
    ],
    'Принтеры': [
      {
        'name': 'Принтер HP',
        'price': 14900,
        'icon': Icons.print,
        'color': Colors.pink,
      },
      {
        'name': 'Принтер Canon',
        'price': 12900,
        'icon': Icons.print,
        'color': Colors.orange,
      },
      {
        'name': 'Принтер Epson',
        'price': 11900,
        'icon': Icons.print,
        'color': Colors.teal,
      },
    ],
    'Игровые устройства': [
      {
        'name': 'PlayStation 5',
        'price': 49900,
        'icon': Icons.sports_esports,
        'color': Colors.blue,
      },
      {
        'name': 'Xbox',
        'price': 44900,
        'icon': Icons.sports_esports,
        'color': Colors.green,
      },
      {
        'name': 'Nintendo Switch',
        'price': 34900,
        'icon': Icons.videogame_asset,
        'color': Colors.red,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final products = productByCategory.values.expand((items) => items).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IStore'),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Icon(
                      products[index]['icon'],
                      color: products[index]['color'],
                      size: 60,
                    ),
                  ),
                  Text(
                    products[index]['name'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${products[index]['price']} сом',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
