import 'package:flutter/material.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/models/maintinance_item_model.dart';
import 'package:taxi_app/views/add%20icome/widgets/empty_list_widget.dart';

class AllMaintainanceListView extends StatelessWidget {
  const AllMaintainanceListView(
      {super.key, required this.items, required this.month});
  final List<MaintinanceModel> items;
  final int month;
  @override
  Widget build(BuildContext context) {
    final filteredTransactions =
        items.where((transaction) => transaction.date.month == month).toList();
    return filteredTransactions.isNotEmpty
        ? ListView.builder(
            itemCount: filteredTransactions.length,
            itemBuilder: (context, index) {
              var cubit = MaintainanceCubitCubit.get(context);
              final transaction = filteredTransactions[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF43A047),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          cubit.deleteDataFromDatabase(
                              id: cubit.maintainances[index].id!);
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(
                      'Date: ${transaction.date.day}/${transaction.date.month}/${transaction.date.year}', // Display day/month/year
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'income: ${transaction.price} ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'The Maintainance: ${transaction.describ}',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : const EmptyLIstWidget(
            iconColor: Color(0xFF43A047),
            text: 'Maintainnaces',
          );
  }
}
