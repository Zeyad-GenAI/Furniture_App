import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Modern Table',
      'price': 1500.00,
      'category': 'Tables',
      'inStock': true,
      'image': Icons.table_restaurant,
    },
    {
      'name': 'Comfort Chair',
      'price': 700.00,
      'category': 'Chairs',
      'inStock': true,
      'image': Icons.chair,
    },
    {
      'name': 'Luxury Sofa',
      'price': 2500.00,
      'category': 'Sofas',
      'inStock': false,
      'image': Icons.weekend,
    },
    {
      'name': 'Coffee Table',
      'price': 800.00,
      'category': 'Tables',
      'inStock': true,
      'image': Icons.table_bar,
    },
    {
      'name': 'Office Desk',
      'price': 1200.00,
      'category': 'Desks',
      'inStock': true,
      'image': Icons.desk,
    },
    {
      'name': 'Reading Lamp',
      'price': 200.00,
      'category': 'Lighting',
      'inStock': true,
      'image': Icons.lightbulb,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Products Catalog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF594137),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Icon(
                        product['image'],
                        size: 60,
                        color: product['inStock'] ? Color(0xFF594137) : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      product['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF594137),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product['category'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product['price'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: product['inStock'] ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            product['inStock'] ? 'In Stock' : 'Out of Stock',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add new product functionality')),
          );
        },
        backgroundColor: Color(0xFF594137),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}