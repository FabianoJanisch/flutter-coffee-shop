class Coffee {
  final String name;
  final String price;
  final String imagePath;
  int quantity;
  double cartPrice;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 0,
    this.cartPrice = 0,
  });
}
