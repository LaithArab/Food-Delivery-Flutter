class FoodItem {
  final String id;
  final String name;
  final double price;
  final String imgUrl;
  final bool isFavorite;
  final int categoryId;

  const FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
    this.isFavorite = false,
    required this.categoryId,
  });

  FoodItem copyWith({
    String? name,
    double? price,
    String? imgUrl,
    bool? isFavorite,
    int? categoryId,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    id: "burger 1",
    name: "Beef Burger",
    price: 15,
    imgUrl:
        'https://images.icon-icons.com/2852/PNG/512/burger_fast_food_icon_181517.png',
    categoryId: 1,
  ),
  FoodItem(
    id: "burger 2",
    name: "Chicken burger",
    price: 13,
    imgUrl:
        'https://images.icon-icons.com/2419/PNG/512/burger_food_icon_146845.png',
    categoryId: 1,
  ),
  FoodItem(
    id: "burger 3",
    name: "Margreta ",
    price: 10,
    imgUrl: 'https://images.icon-icons.com/1361/PNG/96/food-icons01_89023.png',
    categoryId: 1,
  ),
  FoodItem(
    id: "burger 4",
    name: "cheese Burger",
    price: 30,
    imgUrl:
        'https://media.istockphoto.com/id/1386924017/vector/juicy-burger-table-sao-paulo-with-beef-cutlet-truffles-and-poached-egg-watercolor.jpg?s=612x612&w=0&k=20&c=1Q5A3eSwR8bt3tGjwzDzY5piKn8zLS3gjkk9mFQvVoU=',
    categoryId: 1,
  ),
  FoodItem(
    id: "pizza 1",
    name: "Pizza",
    price: 7.5,
    imgUrl:
        'https://images.icon-icons.com/1646/PNG/96/recipepizzaicon_109877.png',
    categoryId: 2,
  ),
  FoodItem(
    id: "pizza 2",
    name: "Chicken Pizza",
    price: 5,
    imgUrl: 'https://images.icon-icons.com/281/PNG/96/Pizza-icon_30282.png',
    categoryId: 2,
  ),
  FoodItem(
    id: "pizza 3",
    name: "Meat Pizza",
    price: 20,
    imgUrl:
        'https://images.icon-icons.com/676/PNG/96/pizza_icon-icons.com_60617.png',
    categoryId: 2,
  ),
];
