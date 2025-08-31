class FoodItem {
  final String name;
  final double price;
  final String imgUrl;
  final bool? isFavorite;

  FoodItem({
    required this.name,
    required this.price,
    required this.imgUrl,
    this.isFavorite = false,
  });
}

List<FoodItem> food = [
  FoodItem(
    name: "Beef Burger",
    price: 15,
    imgUrl:
        'https://images.icon-icons.com/2852/PNG/512/burger_fast_food_icon_181517.png',
    isFavorite: true,
  ),
  FoodItem(
    name: "Chicken Burger",
    price: 13,
    imgUrl:
        'https://images.icon-icons.com/2419/PNG/512/burger_food_icon_146845.png',
  ),
  FoodItem(
    name: "Margreta Burger",
    price: 10,
    imgUrl: 'https://images.icon-icons.com/1361/PNG/96/food-icons01_89023.png',
  ),
  FoodItem(
    name: "cheese Burger",
    price: 30,
    imgUrl:
        'https://media.istockphoto.com/id/1386924017/vector/juicy-burger-table-sao-paulo-with-beef-cutlet-truffles-and-poached-egg-watercolor.jpg?s=612x612&w=0&k=20&c=1Q5A3eSwR8bt3tGjwzDzY5piKn8zLS3gjkk9mFQvVoU=',
  ),
  FoodItem(
    name: "Pizza",
    price: 7.5,
    imgUrl:
        'https://images.icon-icons.com/1646/PNG/96/recipepizzaicon_109877.png',
    isFavorite: true,
  ),
  FoodItem(
    name: "Chicken Pizza",
    price: 5,
    imgUrl: 'https://images.icon-icons.com/281/PNG/96/Pizza-icon_30282.png',
  ),
  FoodItem(
    name: "Meat Pizza",
    price: 20,
    imgUrl:
        'https://images.icon-icons.com/676/PNG/96/pizza_icon-icons.com_60617.png',
  ),
];
