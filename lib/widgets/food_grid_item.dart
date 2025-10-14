import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;
  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      food[widget.foodIndex].imgUrl,
                      height: constraints.maxHeight * 0.55,
                      fit: BoxFit.contain,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: constraints.maxHeight * 0.3,
                        width: constraints.maxWidth * 0.2,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[100],
                        ),
                        child: InkWell(
                          onTap: () => setState(() {
                            food[widget.foodIndex] = food[widget.foodIndex]
                                .copyWith(
                                  isFavorite:
                                      !food[widget.foodIndex].isFavorite,
                                );
                          }),
                          child: Icon(
                            food[widget.foodIndex].isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: constraints.maxHeight * 0.03),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: FittedBox(
                    child: Text(
                      food[widget.foodIndex].name,
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
                      "\$${food[widget.foodIndex].price}",
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
