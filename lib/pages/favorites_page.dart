import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/det_page.dart';
import 'package:food_delivery/ui_models/food_det_args.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget _emptyFavorite() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 100, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "No favorites yet!",
            style: TextStyle(fontSize: 18, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _favoriteFoodPhoto(
    int index,
    Size size,
    bool isLandScape,
    List<FoodItem> favoriteFood,
  ) {
    return Image.network(
      favoriteFood[index].imgUrl,
      height: isLandScape ? size.height * 0.2 : size.height * 0.1,
      width: isLandScape ? size.width * 0.2 : size.height * 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (favoriteFood.isEmpty) {
      return _emptyFavorite();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            debugPrint(favoriteFood[index].name);
          },
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                FoodDetailsPage.source,
                arguments: FoodDetArgs(
                  foodIndex: food.indexOf(favoriteFood[index]),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _favoriteFoodPhoto(index, size, isLandScape, favoriteFood),
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
                        size: isLandScape
                            ? size.height * 0.1
                            : size.height * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
