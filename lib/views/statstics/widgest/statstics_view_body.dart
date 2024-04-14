import 'package:flutter/material.dart';
import 'package:taxi_app/views/statstics/widgest/income_section.dart';

class StatsticsViewBody extends StatelessWidget {
  const StatsticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: IncomeSection()),
      ],
    );
  }
}
