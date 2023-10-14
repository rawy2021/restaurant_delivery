// ignore_for_file: file_names, sort_child_properties_last

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
import 'package:restaurant/view/widget/text_app.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: Dimensions.font20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                  icon: Icons.arrow_back_ios,
                  iconColors: AppColors.shadowColorWhite,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize40,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcons(
                    icon: Icons.home_outlined,
                    iconColors: AppColors.shadowColorWhite,
                    backgroundColor: AppColors.mainColor,
                    size: Dimensions.iconSize40,
                  ),
                ),
                AppIcons(
                  icon: Icons.shopping_cart_checkout_outlined,
                  iconColors: AppColors.shadowColorWhite,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize40,
                ),
              ],
            )),
        Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              //color: Colors.amber,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.width20 * 5,
                                    height: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(

                                          //image: AssetImage(AppImages.food1),
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radios20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextUtils(
                                        text: cartController
                                            .getItems[index].name!,
                                        fontSize: 20,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                      TextUtils(text: "text"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextUtils(
                                            text: cartController
                                                .getItems[index].price!
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: Dimensions.width10,
                                                left: Dimensions.width10,
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radios20),
                                              // color: AppColors.shadowColorWhite,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
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
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString(),
                                                    // popularProduct.inCartItems.toString(),
                                                    fontSize:
                                                        Dimensions.font20),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                            // color: Colors.white,
                            margin: EdgeInsets.only(bottom: 10),
                          );
                        });
                  })),
            ))
      ]),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartcontroller) {
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
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      TextUtils(
                          text: "\$ ${cartcontroller.totalAmount}",
                          fontSize: Dimensions.font20),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //  popularProduct.addItem(product);\
                    print("topped");
                    cartcontroller.addToHistory();
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
                      text: "\$  Check Out",
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
