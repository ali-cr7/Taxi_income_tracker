import 'package:flutter/material.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/models/fules_transaction_model.dart';
import 'package:taxi_app/views/add%20icome/widgets/empty_list_widget.dart';

class FuelTransactionsListView extends StatelessWidget {
  const FuelTransactionsListView({
    super.key,
    required this.transactions,
    required this.month,
  });

  final List<FuelTransactionModel> transactions;
  final int month;
  @override
  Widget build(BuildContext context) {
    final filteredTransactions = transactions
        .where((transaction) => transaction.date.month == month)
        .toList();
    var cubit = FuelTransactionsCubit.get(context);
    return filteredTransactions.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              final transaction = filteredTransactions[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4EB7F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          cubit.deleteDataFromDatabase(
                              id: cubit.fuelTransactions[index].id!);
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(
                      'Date: ${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Amount: ${transaction.amount.toString()} liters'),
                        Text(
                          'Price: ${transaction.price} ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              // return ListViewIFuelTramsactiontem(transaction: transaction);
            },
            itemCount: filteredTransactions.length,
          )
        : EmptyLIstWidget(iconColor: Color(0xFF4EB7F2), text: "Fules");
  }
}
