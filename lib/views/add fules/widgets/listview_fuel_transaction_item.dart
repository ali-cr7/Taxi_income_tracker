// import 'package:flutter/material.dart';
// import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
// import 'package:taxi_app/models/fules_transaction_model.dart';

// class ListViewIFuelTramsactiontem extends StatelessWidget {
//   const ListViewIFuelTramsactiontem({
//     super.key,
//     required this.cubit,
//     required this.transaction,
//   });

//   final FuelTransactionsCubit cubit;
//   final FuelTransactionModel transaction;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//     width: MediaQuery.of(context).size.width * 0.9,
//     decoration: ShapeDecoration(
//       color: const Color(0xFF4EB7F2),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//     child: ListTile(
//       leading: IconButton(onPressed: () {
//         cubit.deleteDataFromDatabase(id: cubit.FuelTransactions[index].id!);
//       }, icon: const Icon(Icons.delete)),
//       title: Text(
//         'Date: ${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Amount: ${transaction.amount.toString()} liters'),
//           Text(
//               'Price: \$${transaction.price.toStringAsFixed(2)} per liter'),
//         ],
//       ),
//     ),
//           ),
//         );
//   }
// }
