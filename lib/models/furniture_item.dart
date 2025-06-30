class FurnitureItem {
  final String name;
  final double price;
  int quantity;

  FurnitureItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}