import 'package:flutter/material.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/models/income_model.dart';

import 'package:taxi_app/views/add%20icome/widgets/empty_list_widget.dart';

class AllIncomeListView extends StatelessWidget {
  const AllIncomeListView({
    super.key,
    required this.incomes,
    required this.month,
  });

  final List<IncomeItemModel> incomes;
  final int month;
  @override
  Widget build(BuildContext context) {
    var cubit = IncomesCubit.get(context);

    // DateTime selectedDate = DateTime(year, month, day);
    final filteredTransactions = incomes
        .where((transaction) => transaction.date.month == month)
        .toList();

    return filteredTransactions.isNotEmpty
        ? ListView.builder(
            itemCount: filteredTransactions.length,
            itemBuilder: (context, index) {
              final transaction = filteredTransactions[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEF5350),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          cubit.deleteDataFromDatabase(
                              id: cubit.incomes[index].id!);
                          print('object');
                          print(cubit.incomes[index].id!);
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(
                        'Date: ${transaction.date.day}/${transaction.date.month}/${transaction.date.year} '),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'income: ${transaction.money} ',
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
            },
          )
        : const EmptyLIstWidget(
            text: 'Incmoes',
            iconColor: Color(0xFFEF5350),
          );
  }
}
