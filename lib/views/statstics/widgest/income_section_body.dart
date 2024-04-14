import 'package:flutter/material.dart';

import 'package:taxi_app/utils/size_config.dart';
import 'package:taxi_app/views/statstics/widgest/detailed_income_chart.dart';
import 'package:taxi_app/views/statstics/widgest/income_chart.dart';
import 'package:taxi_app/views/statstics/widgest/income_details.dart';

class IncomSectionBody extends StatelessWidget {
  final int targetMonth;
  const IncomSectionBody({
    super.key,
    required this.targetMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: IncomeDetails(
          targetMonth: targetMonth,
        )),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: DetailedIncomeChart(
              targetMonth: targetMonth,
            ),
          ),
        ),
      ],
    );
  }
}
