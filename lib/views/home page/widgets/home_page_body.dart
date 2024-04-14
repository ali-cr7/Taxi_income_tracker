import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/utils/router.dart';

//import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/home%20page/widgets/my_card_button.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MyCardButton(
            cardColor: const Color(0xFF4EB7F2),
            onPress: () {
             
              GoRouter.of(context).push(AppRouter.kAddFuleView);
            },
            title: 'fules',
            icon: Icons.local_gas_station_outlined,
          ),
        ),
        Expanded(
          child: MyCardButton(
            cardColor:const Color(0xFFB71C1C),
            onPress: () {
              GoRouter.of(context).push(AppRouter.kAddIncome);
            },
            icon: CupertinoIcons.money_dollar_circle,
            title: 'money',
          ),
        ),
        Expanded(
          child: MyCardButton(
            cardColor:const Color(0xFF2E7D32),
            onPress: () {
              GoRouter.of(context).push(AppRouter.kAddMiantinance);
            },
            icon: CupertinoIcons.car_detailed,
            title: 'maintinace',
          ),
        ),
      ],
    );
  }
}


