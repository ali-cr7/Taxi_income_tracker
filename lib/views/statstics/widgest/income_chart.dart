import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/income%20chart%20cubit/income_chart_cubit.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({Key? key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: BlocBuilder<IncomeChartCubit, int>(
        builder: (context, activeIndex) {
          return PieChart(PieChartData(
            pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (p0, pietouchResponse) {
                  activeIndex =
                      pietouchResponse?.touchedSection?.touchedSectionIndex ??
                          -1;
                  context.read<IncomeChartCubit>().setActiveIndex(activeIndex);
                } 
                ),
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                showTitle: false,
                value: 40,
                radius: activeIndex == 0 ? 60 : 50,
                color: const Color(0xFF208BC7),
              ),
              PieChartSectionData(
                value: 25,
                radius: activeIndex == 1 ? 60 : 50,
                showTitle: false,
                color: const Color(0xFF4DB7F2),
              ),
              PieChartSectionData(
                value: 20,
                radius: activeIndex == 2 ? 60 : 50,
                showTitle: false,
                color: const Color(0xFF064060),
              ),
            ],
          ));
        },
      ),
    );
  }
}
