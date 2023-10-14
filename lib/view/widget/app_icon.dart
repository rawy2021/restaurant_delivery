import 'package:flutter/material.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/colors.dart';

class AppIcons extends StatelessWidget {
  const AppIcons({
    super.key,
    this.backgroundColor = AppColors.buttonBackgroundColor,
    this.iconColors = AppColors.textColorBlack,
    this.size = 40,
    required this.icon,
  });
  final IconData icon;
  final Color backgroundColor;
  final Color iconColors;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColors,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
