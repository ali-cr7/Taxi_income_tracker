import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/models/income_model.dart';

import 'package:taxi_app/views/add%20icome/widgets/all_income_list_view.dart';
import 'package:taxi_app/views/add%20icome/widgets/dropdown_menu_incomes.dart';

class AllIncomeViewBody extends StatelessWidget {
  const AllIncomeViewBody({super.key});
  // static List<IncomeItemModel> incomes = [
  // //   IncomeItemModel(date:" DateTime(2024, 4, 6)", money: 40),
  // // IncomeItemModel(date:" DateTime(2024, 4, 6)", money: 40),
  // ];
  static List<int> items = List.generate(12, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('All Incomes')),
        body: BlocBuilder<IncomesCubit, IncomesState>(
          builder: (context, state) {
            var cubit = IncomesCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: DropDownMeneuIncomes(items: items),
                ),
                Expanded(
                    child: AllIncomeListView(
                  incomes: cubit.incomes,
                  month: state.month ,
                )),
              ],
            );
          },
        ));
  }
}
