class CategoryItem {
  final int id;
  final String title;
  final String imageUrl;

  CategoryItem({required this.id, required this.title, required this.imageUrl});
}

List<CategoryItem> categories = [
  CategoryItem(id: 1, title: 'Burgers', imageUrl: 'assets/category/burger.png'),
  CategoryItem(id: 2, title: 'Pizza', imageUrl: 'assets/category/pizza.png'),
  CategoryItem(
    id: 3,
    title: 'pasta',
    imageUrl: 'assets/category/spaguetti.png',
  ),
];
