import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [const SizedBox(width: 100), const Text('Aklak')]),
      ),
      backgroundColor: Colors.white,
      drawer: const Drawer(child: Center(child: Text("I'm in the dewer"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                'assets/images/lala.png',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32.0),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: [
                        Placeholder(fallbackHeight: 100),
                        Text("Burger"),
                        Text("5\$"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: [
                        Placeholder(fallbackHeight: 100),
                        Text("Burger"),
                        Text("5\$"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: [
                        Placeholder(fallbackHeight: 100),
                        Text("Burger"),
                        Text("5\$"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: [
                        Placeholder(fallbackHeight: 100),
                        Text("Burger"),
                        Text("5\$"),
                      ],
                    ),
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
