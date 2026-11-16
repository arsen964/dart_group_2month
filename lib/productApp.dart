import 'package:flutter/material.dart';

import 'constants.dart';

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Товары'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingSize),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        image: 'images/sneakers.jpg',
                        title: 'Nike air zoom',
                        price: '\$120',
                        category: 'Shoes',
                        rating: 5,
                        sale: true,
                      ),
                    ),
                    SizedBox(width: 12),

                    Expanded(
                      child: ProductCard(
                        image: 'images/goyard.jpg',
                        title: 'Goyard bag',
                        price: '\$1800',
                        category: 'Bags',
                        rating: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        image: 'images/samsung.jpg',
                        title: 'Samsung S25 ultra',
                        price: '\$1100',
                        category: 'Gadgets',
                        rating: 5,
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: ProductCard(
                        image: 'images/iphone.jpg',
                        title: 'Iphone 18 pro max',
                        price: '\$1400',
                        category: 'Gadgets',
                        rating: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool sale;
  final String category;
  final int rating;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    this.sale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
       color: Color(0xFFFFF8E7),
        
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(color: Color(0x332D2418), blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(cardRadius),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, StackTrace) => Container(
                    height: imageHeight,
                    color: Colors.deepOrange,
                    child: Center(child: Text('Нет картинки')),
                  ),
                ),
              ),
              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(cardRadius),
                    ),
                    child: Text(
                      'SALE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 12),

              
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  color: priceColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(cardRadius),
                ),
                child: Text(
                  category,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  );
                }),
              ),
            ],
          ),

          SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 174, 121, 220),
              foregroundColor: Colors.white,
            ),
            child: Text('Купить'),
          ),

          SizedBox(height: 8),

          OutlinedButton(
            onPressed: () {}, // Пока пусто
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white70,
              foregroundColor: Color.fromARGB(255, 133, 88, 176),
            ),
            child: Text('В избранное'),
          ),
        ],
      ),
    );
  }
}
