class CartModel {
  String productId;
  String color;
  int quantity;
  String size;

  CartModel(
      {required this.productId,
      required this.color,
      required this.quantity,
      required this.size});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        productId: json['productId'],
        color: json['color'],
        quantity: json['quantity'],
        size: json['size']);
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'size': size,
      'quantity': quantity,
      'color': color
    };
  }
}
