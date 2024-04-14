import 'package:flutter/material.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/statstics/widgest/statstics_view_body.dart';

class StatsticsView extends StatelessWidget {
  const StatsticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Statstics',
          style: AppStyles.styleSemiBold24(context),
        )),
        body: const StatsticsViewBody());
  }
}
