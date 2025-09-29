import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();
    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/haha.png',
              fit: BoxFit.cover,
              height: 300,
            ),
            const Text(
              "No Favorite Items Found!",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(favoriteFood[index].imgUrl, height: 70),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoriteFood[index].name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${favoriteFood[index].price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final foodTarget = favoriteFood[index];
                    final int foodIndex = food.indexOf(foodTarget);
                    setState(() {
                      food[foodIndex] = food[foodIndex].copyWith(
                        isFavorite: false,
                      );
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
