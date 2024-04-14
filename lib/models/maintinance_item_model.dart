class MaintinanceModel {
  int? id;
  final DateTime date;
  final String describ; // In liters or gallons
  final int price; // Price per liter or gallon

   MaintinanceModel({
    this.id,
    required this.date,
    required this.describ,
    required this.price,
  });
}
