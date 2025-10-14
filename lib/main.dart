import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.deepOrange),
        fontFamily: 'OPenSans',
      ),

      title: 'Aklak - Food Delivery',
      home: BottomNavBarPage(),
    );
  }
}
