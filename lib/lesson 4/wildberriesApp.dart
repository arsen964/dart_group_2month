import 'package:flutter/material.dart';

class WildberriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MarketPage());
  }
}

class MarketPage extends StatefulWidget {
  @override
  State<MarketPage> createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  final Map<String, List<Map<String, dynamic>>> productByCategory = {
    'Мониторы': [
      {
        'name': 'Монитор Xiaomi',
        'price': 19900,
        'icon': Icons.monitor,
        'color': Colors.blue,
      },

      {
        'name': 'Монитор Dexp',
        'price': 12900,
        'icon': Icons.monitor,
        'color': Colors.purple,
      },

      {
        'name': 'Монитор Acer',
        'price': 14900,
        'icon': Icons.monitor,
        'color': Colors.teal,
      },
    ],

    'Принтеры': [
      {
        'name': 'Принтер HP',
        'price': 14900,
        'icon': Icons.print,
        'color': Colors.orange,
      },

      {
        'name': 'Принтер Canon',
        'price': 12900,
        'icon': Icons.print,
        'color': Colors.red,
      },

      {
        'name': 'Принтер Epson',
        'price': 11900,
        'icon': Icons.print,
        'color': Colors.green,
      },
    ],

    'Консоли': [
      {
        'name': 'PlayStation 5',
        'price': 49900,
        'icon': Icons.sports_esports,
        'color': Colors.indigo,
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
        'color': Colors.deepOrange,
      },
    ],
  };
  Set<String> favorites = {};

  int currentIndex = 0;

  void toggleFavorite(String product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  Widget buildProductList(List<Map<String, dynamic>> products) {
    if (products.isEmpty) {
      return Center(child: Text('Список пуст'));
    }

    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.shade300,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        );
      },

      itemBuilder: (context, index) {
        Map<String, dynamic> product = products[index];

        String name = product['name'];
        int price = product['price'];
        IconData productIcon = product['icon'];
        Color iconColor = product['color'];

        bool isFavorite = favorites.contains(name);

        return ListTile(
          leading: Icon(productIcon, color: iconColor, size: 28),
          title: Text(name, style: TextStyle(fontSize: 16)),
          subtitle: Text('Цена: $price сом'),
          trailing: IconButton(
            onPressed: () {
              toggleFavorite(name);
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        );
      },
    );
  }

  Widget buildProductGrid(List<Map<String, dynamic>> products) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        Map<String, dynamic> product = products[index];

        return Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(product['icon'], color: product['color'], size: 40),
              SizedBox(height: 10),
              Text(
                product['name'],
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text('${product['price']} сом'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1E293B),
          foregroundColor: Colors.white,
          title: Text(
            currentIndex == 0
                ? 'Каталог товаров'
                : currentIndex == 1
                ? 'Избранное'
                : 'Профиль',
          ),
          centerTitle: true,
          bottom: currentIndex == 0
              ? TabBar(
                  labelColor: Color(0xFF38BDF8),
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Color(0xFF38BDF8),
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: 'Мониторы'),
                    Tab(text: 'Принтеры'),
                    Tab(text: 'Консоли'),
                    Tab(text: 'Все товары'),
                  ],
                )
              : null,
        ),
        body: currentIndex == 0
            ? TabBarView(
                children: [
                  buildProductList(productByCategory['Мониторы']!),
                  buildProductList(productByCategory['Принтеры']!),
                  buildProductList(productByCategory['Консоли']!),
                  buildProductGrid(
                    productByCategory.values
                        .expand((products) => products)
                        .toList(),
                  ),
                ],
              )
            : currentIndex == 1
            ? buildProductList(
                productByCategory.values
                    .expand((products) => products)
                    .where((product) => favorites.contains(product['name']))
                    .toList(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 60, color: Colors.amber),
                    SizedBox(height: 16),

                    Text(
                      'Профиль пользовотеля',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Color(0xFF38BDF8),
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(0xFF1E293B),
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
