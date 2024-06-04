class Product {
  String id;
  String brandId;
  List<String> images;
  List<String> colorOptions;
  String name;
  List<String> sizeOptions;
  String description;
  double price;

  Product({
    required this.id,
    required this.brandId,
    required this.images,
    required this.colorOptions,
    required this.name,
    required this.sizeOptions,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brandId: json['brandId'],
      images: List<String>.from(json['images']),
      colorOptions: List<String>.from(json['colorOptions']),
      name: json['name'],
      sizeOptions: List<String>.from(json['sizeOptions']),
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

}
