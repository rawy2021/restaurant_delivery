
import 'package:flutter/material.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/text_app.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;

  const IconAndTextWidget({super.key,
    required this.icon,
    required this.textColor,
    required this.iconColor,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size:Dimensions.iconSize20,),
        SizedBox(width: Dimensions.width2,),
        TextUtils(
          text: text ,
          fontSize:Dimensions.font12,
          color: AppColors.textColor,)
      ],
    );
  }
}
