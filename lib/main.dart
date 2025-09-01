import 'package:flutter/material.dart';
import 'package:food_delivery/pages/botton_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aklak - Food Delivery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavBarPage(),
    );
  }
}
