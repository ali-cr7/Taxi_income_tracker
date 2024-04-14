import 'package:flutter/material.dart';

class CustomeTextFromField extends StatelessWidget {
  final String labelText; // Make label text a required variable
  final IconData iconData;
  final Color iconColor, labelTextColor;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Function()? ontap;
  const CustomeTextFromField({
    Key? key,
    required this.labelText, // Mark labelText as required
    required this.iconData,
    this.controller,
    required this.iconColor,
    required this.labelTextColor,
    required this.inputType,
    this.ontap, // Mark iconData as required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // enabledBorder: buildBorder(),
          border: buildBorder(),
          labelText: labelText, // Use the provided labelText
          labelStyle: TextStyle(
            color: labelTextColor,
          ),
          suffixIcon: Icon(
            iconData, // Use the provided iconData
            color: iconColor,
          ),
        ),
        keyboardType: inputType,
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color(0xFFFAFAFA),
    ),
  );
}
