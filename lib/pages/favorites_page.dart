import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_item.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: food
              .where((foodItem) => foodItem.isFavorite == true)
              .map((foodItem) => FavoriteItem(foodItem: foodItem))
              .toList(),
        ),
      ),
    );
  }
}
