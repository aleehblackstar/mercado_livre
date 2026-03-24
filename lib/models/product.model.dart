class Product {
  final int id;
  final String title;
  final String color;
  final double price;
  final String image;
  double rating;

  Product({
    required this.id,
    required this.title,
    required this.color,
    required this.price,
    required this.image,
    this.rating = 5,
  });
}
