import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controllers/cart-controller.dart';
import 'package:restaurant/controllers/popular_product_controller.dart';
import 'package:restaurant/controllers/recommended-product-controller.dart';
import 'package:restaurant/route/route-helper.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/app_constants.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/app_icon.dart';
import 'package:restaurant/view/widget/expandable_text_widget.dart';
import 'package:restaurant/view/widget/text_app.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;

  const RecommendedFoodDetails(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
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
                      child: const AppIcons(icon: Icons.clear)),
                  // const AppIcons(icon: Icons.shopping_cart_checkout_outlined),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          const AppIcons(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
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
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Dimensions.font20),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radios20),
                          topRight: Radius.circular(Dimensions.radios20),
                        ),
                        color: AppColors.shadowColorWhite,
                      ),
                      padding: EdgeInsets.only(
                          bottom: Dimensions.height10,
                          top: Dimensions.height10),
                      width: double.infinity,
                      child: Center(
                        child: TextUtils(
                          text: product.name!,
                          fontSize: Dimensions.font18,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  // AppImages.food2,
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.height20),
                      child: ExpandableTextWidget(
                        text: product.description!,
                      )),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height15,
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuality(false);
                        },
                        child: const AppIcons(
                          icon: Icons.remove,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                      TextUtils(
                        text:
                            "\$ ${product.price}  X  ${controller.inCartItems}",
                        fontSize: Dimensions.font20,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuality(true);
                        },
                        child: const AppIcons(
                          icon: Icons.add,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                            borderRadius: BorderRadius.circular(
                                Dimensions.radios30 * 0.5),
                            color: AppColors.shadowColorWhite,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                            size: 40,
                          )),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              right: Dimensions.width10,
                              left: Dimensions.width10,
                              top: Dimensions.height10,
                              bottom: Dimensions.height10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radios30 * 0.5),
                              color: AppColors.mainColor),
                          child: TextUtils(
                            text: "\$ ${product.price!} Add To Card",
                            fontSize: Dimensions.font18,
                            color: AppColors.buttonBackgroundColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
