import 'package:flutter/material.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/icon_and_text_widget.dart';
import 'package:restaurant/view/widget/text_app.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextUtils(
                text: text,
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star_sharp,
                        color: AppColors.yellowColor,
                        size: Dimensions.font15,
                      )),
            ),
            SizedBox(
              width: Dimensions.width5,
            ),
            TextUtils(
              text: "4.5",
              fontSize: Dimensions.font12,
              color: AppColors.textColor,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            TextUtils(
              text: "1235",
              fontSize: Dimensions.font12,
              color: AppColors.textColor,
            ),
            SizedBox(
              width: Dimensions.width5,
            ),
            TextUtils(
              text: "Comment",
              fontSize: Dimensions.font12,
              color: AppColors.textColor,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle,
              textColor: AppColors.textColor,
              iconColor: AppColors.yellowColor,
              text: "normal",
            ),
            IconAndTextWidget(
                icon: Icons.location_on_sharp,
                textColor: AppColors.textColor,
                iconColor: AppColors.mainColor,
                text: "1.8 KM"),
            IconAndTextWidget(
                icon: Icons.access_time_sharp,
                textColor: AppColors.textColor,
                iconColor: AppColors.blueColor,
                text: "32 min"),
          ],
        ),
      ],
    );
  }
}
