import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Row(children: [const SizedBox(width: 100), const Text('Aklak')]),
      ),
      backgroundColor: Colors.grey[100],
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
              child: GridView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(
                          food[index].imgUrl,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          food[index].name,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "\$${food[index].price}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
