import 'furniture_item.dart';

class Invoice {
  final String id;
  final DateTime date;
  final List<FurnitureItem> items;
  final double totalAmount;

  Invoice({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
  });
}