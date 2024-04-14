import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';

class DropDownMeneuIncomes extends StatelessWidget {
  const DropDownMeneuIncomes({
    super.key,
    required this.items,
  });
  final List<int> items;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      leadingIcon: Icon(
        Icons.calendar_month,
        color: Color(0xFFB71C1C),
      ),
      label: Text(
        'The Month',
        style:
            AppStyles.styleBold16(context).copyWith(color: Color(0xFFB71C1C)),
      ),
      helperText: 'Choose the Month',
      textStyle: AppStyles.styleSemiBold20(context).copyWith(
        color: Color(0xFFB71C1C),
      ),
      initialSelection: items.first,
      onSelected: (int? value) {
        context.read<IncomesCubit>().setSelectedMonth(value!);
      },
      dropdownMenuEntries: items.map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(value: value, label: value.toString());
      }).toList(),
    );
  }
}
