import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/models/drawer_item_model.dart';
import 'package:taxi_app/utils/router.dart';
import 'package:taxi_app/views/home%20page/widgets/active_and_inactive_drawer_item.dart';
import 'package:taxi_app/views/home%20page/widgets/drawer_header.dart';
import 'package:taxi_app/views/home%20page/widgets/drawer_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: DrawerHeaderItem(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          const DrawerListView(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kStatsticView);
                  },
                  child: const InActiveDrawerItem(
                      drawerItemModel: DrawerItemModel(
                    CupertinoIcons.chart_bar_circle_fill,
                    title: "The Statstic",
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: const InActiveDrawerItem(
                      drawerItemModel: DrawerItemModel(
                    Icons.logout,
                    title: "Logout",
                  )),
                ),
                const SizedBox(
                  height: 48,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
