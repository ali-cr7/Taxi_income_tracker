import 'package:flutter/material.dart';
// import 'package:taxi_app/utils/app_styles.dart';

class MyCardButton extends StatelessWidget {
  const MyCardButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.cardColor,
    this.icon, // Add an optional icon parameter
  });

  final String title;
  final Function() onPress;
  final Color cardColor;
  final IconData? icon; // Declare an optional IconData for the icon

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: ShapeDecoration(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) // Display the icon if provided
                  Icon(
                    icon,
                    size: 36,
                    color: Colors.white,
                  ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

