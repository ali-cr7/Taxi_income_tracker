import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child, this.pading,
  });
  final Widget child;
  final double? pading;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.all(pading?? 20),
        //color: Colors.white,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: child);
  }
}