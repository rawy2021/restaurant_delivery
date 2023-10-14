import 'package:flutter/material.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/view/home/food_page_body.dart';
import '../../utils/colors.dart';
import '../widget/text_app.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height10, bottom: Dimensions.height20),
              padding: EdgeInsets.only(
                  right: Dimensions.width10, left: Dimensions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        TextUtils(
                          text: 'Cooking',
                          fontSize: Dimensions.font30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            TextUtils(
                              text: 'Drop Down',
                              fontSize: Dimensions.font18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.paraColor,
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height40,
                      width: Dimensions.width35,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radios10),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search_outlined,
                        color: AppColors.buttonBackgroundColor,
                        size: Dimensions.iconSize26,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
      ),
    );
  }
}
