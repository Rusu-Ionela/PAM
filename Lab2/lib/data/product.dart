class Product {
  final String id;
  final String brand;
  final String title;
  final double price;
  final double? oldPrice; // pentru discount
  final String imageUrl; // thumbnail / copertă
  final List<String>? images; // galerie (opțional)
  final String? description; // descriere (opțional)
  final double rating; // 0..5
  final int reviews;
  final bool isNew;

  const Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    this.images,
    this.description,
    required this.rating,
    required this.reviews,
    this.isNew = false,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;
}
