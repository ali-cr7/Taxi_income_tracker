import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/utils/app_images.dart';
import 'package:taxi_app/utils/app_styles.dart';

class DrawerHeaderItem extends StatelessWidget {
  const DrawerHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFAFAFA),
      elevation: 0,
      child: ListTile(
        leading: SvgPicture.asset(
          Assets.imagesAvatar3,
          color:const Color(0xFF4EB7F2),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'TAxi',
            style: AppStyles.styleSemiBold16(context),
          ),
        ),
      ),
    );
  }
}
