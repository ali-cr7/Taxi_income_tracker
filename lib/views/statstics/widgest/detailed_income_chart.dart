// import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';

import 'package:taxi_app/cubit/income%20chart%20cubit/income_chart_cubit.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';

class DetailedIncomeChart extends StatelessWidget {
  const DetailedIncomeChart({super.key, required this.targetMonth});
  final int targetMonth;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: BlocBuilder<IncomeChartCubit, int>(
        builder: (context, activeIndex) {
          var cubit = IncomesCubit.get(context);
          var cubit1 = FuelTransactionsCubit.get(context);
          var cubit2 = MaintainanceCubitCubit.get(context);
          var sum1 = cubit.getSumForMonth(cubit.incomes, targetMonth);
          var sum2 =
              cubit1.getSumForMonth(cubit1.fuelTransactions, targetMonth);
          var sum3 = cubit2.getSumForMonth(cubit2.maintainances, targetMonth);
          var sum4 = sum1 - (sum2 + sum3);
          double? per1, per2, per3;
          if (sum1 != 0) {
            per1 = sum4.toDouble() / sum1.toDouble() * 100;
            per2 = sum2.toDouble() / sum1.toDouble() * 100;
            per3 = sum3.toDouble() / sum1.toDouble() * 100;
          } else {
            // Handle the case when sum1 is zero (avoid division by zero)
            per1 = 0.001;
            per2 = 0.001;
            per3 = 0.001;
          }
          return PieChart(PieChartData(
            pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (p0, pietouchResponse) {
                  activeIndex =
                      pietouchResponse?.touchedSection?.touchedSectionIndex ??
                          -1;
                  context.read<IncomeChartCubit>().setActiveIndex(activeIndex);
                  //  log(activeIndex);
                  //   log(pietouchResponse!.touchedSection!.touchedSectionIndex);
                } // Disable built-in touch handling
                ),
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                titlePositionPercentageOffset: activeIndex == 0 ? 1.5 : null,
                title:
                    activeIndex == 0 ? 'The Profit' : '${per1.toInt()}%',
                titleStyle: AppStyles.styleMedium16(context)
                    .copyWith(color: activeIndex == 0 ? null : Colors.black),
                radius: activeIndex == 0 ? 60 : 50,
                value: per1,
                color: const Color(0xFFB71C1C),
              ),
              PieChartSectionData(
                titlePositionPercentageOffset: activeIndex == 1 ? 1.5 : null,
                titleStyle: AppStyles.styleMedium16(context)
                    .copyWith(color: activeIndex == 1 ? null : Colors.black),
                title: activeIndex == 1 ? 'The Fuel' : '${per2.toInt()}%',
                value: per2,
                radius: activeIndex == 1 ? 60 : 50,
                color: const Color(0xFF4EB7F2),
              ),
              PieChartSectionData(
                titlePositionPercentageOffset: activeIndex == 2 ? 1.6 : null,
                titleStyle: AppStyles.styleMedium16(context)
                    .copyWith(color: activeIndex == 2 ? null : Colors.black),
                title: activeIndex == 2
                    ? 'The Mianitinance'
                    : '${per3.toInt()}%',
                value: per3,
                radius: activeIndex == 2 ? 60 : 50,
                color: const Color(0xFF2E7D32),
              ),
            ],
          ));
        },
      ),
    );
  }
}
