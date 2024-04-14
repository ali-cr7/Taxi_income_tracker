class IncomeItemModel {
  final DateTime date;
  final int money; // In liters or gallons
  int? id;
   IncomeItemModel({
    this.id,
    required this.date,
    required this.money,
  });
}
