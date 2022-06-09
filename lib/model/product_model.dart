class ProductModel {
  bool isFavorite;
  final String imagePath;
  final String title;
  final double price;
  final String description;

  ProductModel({
    required this.isFavorite,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  });
}
