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
    final size = MediaQuery.of(context).size;
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/haha.png',
              fit: BoxFit.cover,
              height: isLandScape ? size.height * 0.5 : size.height * 0.3,
            ),
            Text(
              "No Favorite Items Found!",
              style: Theme.of(context).textTheme.headlineSmall,
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
                Image.network(
                  favoriteFood[index].imgUrl,
                  height: isLandScape ? size.height * 0.2 : size.height * 0.1,
                  width: isLandScape ? size.width * 0.2 : size.height * 0.2,
                ),
                SizedBox(width: size.width * 0.03),
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
                    size: isLandScape ? size.height * 0.1 : size.height * 0.035,
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
