// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controllers/cart-controller.dart';
import 'package:restaurant/controllers/popular_product_controller.dart';
import 'package:restaurant/route/route-helper.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/app_constants.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/app_column.dart';
import 'package:restaurant/view/widget/app_icon.dart';
import 'package:restaurant/view/widget/expandable_text_widget.dart';
import 'package:restaurant/view/widget/text_app.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetails({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    // image: AssetImage(
                    //   AppImages.food2,
                    // ),
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height20,
            left: Dimensions.width10,
            right: Dimensions.width10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if (page == "cartpage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: const AppIcons(icon: Icons.arrow_back_ios)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        const AppIcons(icon: Icons.shopping_cart_outlined),
                        controller.totalItems >= 1
                            ? const Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcons(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColors: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 6,
                                top: 3,
                                child: TextUtils(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  fontSize: 14,
                                  color: AppColors.shadowColorWhite,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    right: Dimensions.width10,
                    left: Dimensions.width10,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radios20),
                      topLeft: Radius.circular(Dimensions.radios20),
                    ),
                    color: AppColors.shadowColorWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    TextUtils(
                      text: "Introduce",
                      fontSize: Dimensions.font18,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child:
                              ExpandableTextWidget(text: product.description!)),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.buttonHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              right: Dimensions.width10,
              left: Dimensions.width10,
            ),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20 * 2),
                    topRight: Radius.circular(Dimensions.font20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: Dimensions.width10,
                      left: Dimensions.width10,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radios20),
                    // color: AppColors.shadowColorWhite,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuality(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      TextUtils(
                          text: popularProduct.inCartItems.toString(),
                          fontSize: Dimensions.font20),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuality(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                        top: Dimensions.height10,
                        bottom: Dimensions.height10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radios30 * 0.5),
                        color: AppColors.mainColor),
                    // child: GestureDetector(
                    //   onTap: () {
                    //     popularProduct.addItem(product);
                    //   },
                    child: TextUtils(
                      text: "\$ ${product.price} Add To Card",
                      //text: "\$ ${proudct.price!}10 Add To Card",
                      fontSize: Dimensions.font18,
                      color: AppColors.buttonBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
