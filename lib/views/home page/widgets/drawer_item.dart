import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

//import 'package:responsive_dash_doard/utils/app_styles.dart';

import 'package:taxi_app/models/drawer_item_model.dart';
import 'package:taxi_app/views/home%20page/widgets/active_and_inactive_drawer_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.drawerItemModel, required this.isActive});
  final DrawerItemModel drawerItemModel;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveDrawerItem(drawerItemModel: drawerItemModel,)
        : InActiveDrawerItem(drawerItemModel: drawerItemModel);
  }
}


