import 'package:flutter/material.dart';
import 'package:taxi_app/utils/app_styles.dart';

class EmptyLIstWidget extends StatelessWidget {
  const EmptyLIstWidget({
    super.key,
    required this.iconColor, required this.text,
  });
  final Color iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "There Is No ${text} this Month",
          style: AppStyles.styleSemiBold24(context).copyWith(color: iconColor),
        ),
        Icon(
          Icons.tag_faces_sharp,
          color: iconColor,
          size: 40,
        )
      ],
    ));
  }
}
