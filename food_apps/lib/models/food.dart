class Food {
  final String id;
  final String category;
  final String title;
  final String? description;
  final double price;
  final double? oldPrice;
  final String? imageUrl;
  final bool isFavorite;

  Food({
    required this.id,
    required this.category,
    required this.title,
    required this.price,
    this.imageUrl,
    this.description,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Food> foods = [
  Food(
    id: 'f1',
    category: 'hot food',
    title: 'Pizza',
    description: 'Delicious cheese pizza',
    price: 9000,
    oldPrice: 12000,
    imageUrl: 'assets/images/chicken-medium.png',
  ),
  Food(
    id: 'f2',
    category: 'hot food',
    title: 'Burger',
    description: 'Juicy beef burger with lettuce and tomato',
    price: 7000,
    oldPrice: 12000,
    imageUrl: 'assets/images/miga.jpg',
  ),
  Food(
    id: 'f3',
    category: 'hot food',
    title: 'Pasta',
    description: 'Creamy Alfredo pasta with chicken',
    price: 12000,
    oldPrice: 15000,
    imageUrl: 'assets/images/pasta.jpg',
  ),
  Food(
    id: 'f4',
    category: 'hot food',
    title: 'Salad',
    description: 'Fresh garden salad with a variety of vegetables',
    price: 6000,
    oldPrice: 12000,
    imageUrl: 'assets/images/salad.jpg',
  ),
  Food(
    id: 'f5',
    category: 'hot food',
    title: 'Sushi',
    description: 'Fresh sushi rolls with fish and vegetables',
    price: 14000,
    oldPrice: 18000,
    imageUrl: 'assets/images/sushi.jpg',
  ),

  // Demo more 20 items
];
