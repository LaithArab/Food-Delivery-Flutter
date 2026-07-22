import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_foodItem.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredFood;

  FoodGridItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  Widget build(BuildContext context) {
    final actualFoodIndex = food.indexOf(filteredFood[foodIndex]);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.network(
                      filteredFood[foodIndex].imgUrl,
                      height: constraints.maxHeight * 0.55,
                      fit: BoxFit.contain,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavoriteFooditem(
                        constraints: constraints,
                        foodIndex: actualFoodIndex,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: constraints.maxHeight * 0.03),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: FittedBox(
                    child: Text(
                      filteredFood[foodIndex].name,
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(fontFamily: 'OpenSans'),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                SizedBox(
                  height: constraints.maxHeight * 0.15,
                  child: FittedBox(
                    child: Text(
                      "\$${filteredFood[foodIndex].price}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
