import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/income%20chart%20cubit/income_chart_cubit.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/statstics/widgest/custom_background_container.dart';
import 'package:taxi_app/views/statstics/widgest/income_section_body.dart';
import 'package:taxi_app/views/statstics/widgest/income_section_header.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(12, (index) => index + 1);
    var sum =0;
    return CustomContainer(
      child: BlocBuilder<IncomeChartCubit, int>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Income',
                    style: AppStyles.styleSemiBold20(context),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
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
                         sum = context
                            .read<IncomeChartCubit>()
                            .setActiveIndex1(value!);
                        //   context.read<FuelTransactionsCubit>().setSelectedMonth(value!);
                      },
                      dropdownMenuEntries:
                          items.map<DropdownMenuEntry<int>>((int value) {
                        return DropdownMenuEntry<int>(
                            value: value, label: value.toString());
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: IncomSectionBody(
                targetMonth: sum,
              )),
            ],
          );
        },
      ),
    );
  }
}
