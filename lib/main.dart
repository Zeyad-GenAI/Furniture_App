import 'package:flutter/material.dart';
import 'package:furniturestore/screens/home_screen.dart';
import 'package:furniturestore/screens/invoices_screen.dart';
import 'package:furniturestore/screens/new_order_screen.dart';
import 'package:furniturestore/screens/products_screen.dart';
import 'package:furniturestore/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture Store',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/new-order': (context) => NewOrderScreen(),
        '/invoices': (context) => InvoicesScreen(),
        '/products': (context) => ProductsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}