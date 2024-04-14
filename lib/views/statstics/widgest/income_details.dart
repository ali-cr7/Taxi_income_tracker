import 'package:flutter/material.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/models/item_details_model.dart';
import 'package:taxi_app/views/statstics/widgest/item_details.dart';

class IncomeDetails extends StatelessWidget {
  IncomeDetails({super.key, required this.targetMonth});
  final int targetMonth;
  @override
  Widget build(BuildContext context) {
    var cubit = IncomesCubit.get(context);
    var cubit1 = FuelTransactionsCubit.get(context);
    var cubit2 = MaintainanceCubitCubit.get(context);
    var sum1 = cubit.getSumForMonth(cubit.incomes, targetMonth);
    var sum2 = cubit1.getSumForMonth(cubit1.fuelTransactions, targetMonth);
    var sum3 = cubit2.getSumForMonth(cubit2.maintainances, targetMonth);
    var sum4 = sum1 - (sum2 + sum3);
    List items = [
      ItemDetailsModel(
          color: Color(0xFFB71C1C),
          title: 'The Profit',
          value: sum4.toString()),
      ItemDetailsModel(
          color: Color(0xFF4EB7F2), title: 'The Fuel', value: sum2.toString()),
      ItemDetailsModel(
          color: Color(0xFF2E7D32),
          title: 'The Maintainance',
          value: sum3.toString()),
      ItemDetailsModel(
          color: Colors.black12,
          title: 'The Total Income',
          value: sum1.toString())
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((e) => Expanded(child: ItemDetails(itemDetailsModel: e)))
          .toList(),
    );
  }
}
