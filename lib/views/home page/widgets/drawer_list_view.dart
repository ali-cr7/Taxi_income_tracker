import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/cubit/drawer%20cubit/drawer_item_cubit.dart';
import 'package:taxi_app/models/drawer_item_model.dart';
import 'package:taxi_app/views/home%20page/widgets/drawer_item.dart';
import '../../../utils/router.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({Key? key}) : super(key: key);
  static const List<DrawerItemModel> items = [
    DrawerItemModel(
        title: 'FulesTransaction',
        Icons.local_gas_station_outlined),
    DrawerItemModel(
        title: 'My Income',
      
        CupertinoIcons.money_dollar_circle_fill),
    DrawerItemModel(
        title: 'Maintainance',
       
        Icons.car_repair_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerItemCubit(),
      child: BlocBuilder<DrawerItemCubit, DrawerItemState>(
        builder: (context, state) {
          return SliverList.builder(
            itemCount: items.length,
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: GestureDetector(
                  onTap: () {
                    context.read<DrawerItemCubit>().onItemTapped(index);
                    if (index == 0) {
                      GoRouter.of(context).push(AppRouter.kFulesTransaction);
                    }
                    if (index == 1) {
                      GoRouter.of(context).push(AppRouter.kAllIncomeView);
                    }
                    if (index == 2) {
                      GoRouter.of(context).push(AppRouter.kAllMaintinanceView);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DrawerItem(
                      drawerItemModel: items[index],
                      isActive: state.activeIndex == index,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
