import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';

class DropDownMeneuMaintainance extends StatelessWidget {
  const DropDownMeneuMaintainance({
    super.key,
    required this.items,
  });
  final List<int> items;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      leadingIcon: Icon(
        Icons.calendar_month,
        color: Color(0xFF2E7D32),
      ),
      label: Text(
        'The Month',
        style:
            AppStyles.styleBold16(context).copyWith(color: Color(0xFF2E7D32)),
      ),
      helperText: 'Choose the Month',
      textStyle: AppStyles.styleSemiBold20(context).copyWith(
        color: Color(0xFF2E7D32),
      ),
      initialSelection: items.first,
      onSelected: (int? value) {
        context.read<MaintainanceCubitCubit>().setSelectedMonth(value!);
      },
      dropdownMenuEntries: items.map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(value: value, label: value.toString());
      }).toList(),
    );
  }
}
