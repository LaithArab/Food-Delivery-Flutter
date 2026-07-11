import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorites_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavBarPage> {
  int selectedIndex = 1;
  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  List<Widget> bodyOption = const [FavoritesPage(), HomePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget? appBar;
    late final bottomNavBar;
    if (Platform.isAndroid) {
      appBar = AppBar(
        title: const Row(children: [SizedBox(width: 100), Text('Aklak')]),
      );
      bottomNavBar = BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
      );
    } else if (!Platform.isIOS) {
      appBar = CupertinoNavigationBar(middle: Text("Aklak"));
      bottomNavBar = CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        activeColor: Theme.of(context).primaryColor,
      );
    } else
      appBar = null;
    return Scaffold(
      appBar: appBar,
      drawer: const Drawer(child: Center(child: Text("I'm in the dewer"))),

      bottomNavigationBar: bottomNavBar,
      body: SafeArea(child: bodyOption[selectedIndex]),
    );
  }
}
