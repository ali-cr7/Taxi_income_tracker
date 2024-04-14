import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
// import 'package:flutter/widgets.dart';
import 'package:taxi_app/models/maintinance_item_model.dart';
import 'package:taxi_app/views/add%20maintiance/widgets/all_maintainance_list_view.dart';
import 'package:taxi_app/views/add%20maintiance/widgets/dropdown_menu_incomes.dart';

class AllMaintainanceViewBody extends StatelessWidget {
  AllMaintainanceViewBody({super.key});
  static List<MaintinanceModel> items = [
    MaintinanceModel(
        date: DateTime(2024, 1, 2), describ: 'Hi it is ali', price: 555),
    MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
    MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
    MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
          MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
          MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
          MaintinanceModel(
        date: DateTime(2024, 6, 2), describ: 'Hi it is ali', price: 555),
          MaintinanceModel(
        date: DateTime(2024, 3, 2), describ: 'Hi it is ali', price: 555),
  ];
  List<int> items1 = List.generate(12, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Maintianances')),
      body: BlocBuilder<MaintainanceCubitCubit, MaintainanceCubitState>(
        builder: (context, state) {
          var cubit =MaintainanceCubitCubit.get(context); 
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: DropDownMeneuMaintainance(items: items1),
              ),
              Expanded(
                  child: AllMaintainanceListView(
                      month: state.month, items: cubit.maintainances)),
            ],
          );
        },
      ),
    );
  }
}
