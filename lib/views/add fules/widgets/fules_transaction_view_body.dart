import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/add%20fules/widgets/dropdown_menu.dart';
import 'package:taxi_app/views/add%20fules/widgets/fuel_transaction_list_view.dart';

// import '../../../models/fules_transaction_model.dart';

class FuelTransactionsViewBody extends StatelessWidget {
  // static List<FuelTransactionModel> transactions = [
  //   FuelTransactionModel(date: DateTime(2024, 2, 5), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 2, 5), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 3, 5), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 2, 5), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 2, 5), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 12, 4), amount: 30.5, price: 2.75),
  //   FuelTransactionModel(date: DateTime(2024, 12, 5), amount: 30.5, price: 2.75),
  // ];

  static List<int> items = List.generate(12, (index) => index + 1);

  FuelTransactionsViewBody({Key? key}) : super(key: key);
  late int month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Fuel Transactions',
        style: AppStyles.styleSemiBold24(context),
      )),
      body: BlocBuilder<FuelTransactionsCubit, FuelTransactionsState>(
        builder: (context, state) {
          var cubit = FuelTransactionsCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: DropDownMeneu(items: items),
              ),
              Expanded(
                  child: FuelTransactionsListView(
                      month: state.month, transactions: cubit.fuelTransactions)),
            ],
          );
        },
      ),
    );
  }
}
