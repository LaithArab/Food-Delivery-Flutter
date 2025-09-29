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
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [SizedBox(width: 100), Text('Aklak')]),
      ),
      drawer: const Drawer(child: Center(child: Text("I'm in the dewer"))),

      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: bodyOption[selectedIndex],
    );
  }
}
