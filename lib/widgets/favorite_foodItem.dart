import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteFooditem extends StatefulWidget {
  final BoxConstraints constraints;
  final int foodIndex;
  const FavoriteFooditem({
    super.key,
    required this.constraints,
    required this.foodIndex,
  });

  @override
  State<FavoriteFooditem> createState() => _FavoriteFooditemState();
}

class _FavoriteFooditemState extends State<FavoriteFooditem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints.maxHeight * 0.3,
      width: widget.constraints.maxWidth * 0.2,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[100],
      ),
      child: InkWell(
        onTap: () => setState(() {
          food[widget.foodIndex] = food[widget.foodIndex].copyWith(
            isFavorite: !food[widget.foodIndex].isFavorite,
          );
        }),
        child: Icon(
          food[widget.foodIndex].isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
