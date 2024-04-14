class FuelTransactionModel {
  final DateTime date;
  final int amount; // In liters or gallons
  final int price; // Price per liter or gallon
  int? id;
   FuelTransactionModel({
    this.id,
    required this.date,
    required this.amount,
    required this.price,
  });
}
