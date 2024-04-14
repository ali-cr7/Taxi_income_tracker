import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';

class IncomeSectionHeader extends StatelessWidget {
  const IncomeSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(12, (index) => index + 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Income',
          style: AppStyles.styleSemiBold20(context),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: DropdownMenu<int>(
            leadingIcon: Icon(
              Icons.calendar_month,
              color: Color(0xFF4EB7F2),
            ),
            label: Text(
              'The Month',
              style: AppStyles.styleBold16(context),
            ),
            textStyle: AppStyles.styleSemiBold20(context).copyWith(
              color: Color(0xFF064061),
            ),
            initialSelection: items.first,
            onSelected: (int? value) {
             //   context.read<FuelTransactionsCubit>().setSelectedMonth(value!);
            },
            dropdownMenuEntries: items.map<DropdownMenuEntry<int>>((int value) {
              return DropdownMenuEntry<int>(
                  value: value, label: value.toString());
            }).toList(),
          ),
        ),
      ],
    );
  }
}
