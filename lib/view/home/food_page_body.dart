import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant/controllers/popular_product_controller.dart';
import 'package:restaurant/controllers/recommended-product-controller.dart';
import 'package:restaurant/model/product_model.dart';
import 'package:restaurant/route/route-helper.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/app_constants.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/app_column.dart';
import 'package:restaurant/view/widget/icon_and_text_widget.dart';
import 'package:restaurant/view/widget/text_app.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    padding: EdgeInsets.only(top: Dimensions.height5),
                    height: Dimensions.pageView,
                    child: PageView.builder(
                        itemCount: popularProducts.popularProductList.length,
                        //itemCount: 5,
                        controller: pageController,
                        itemBuilder: (context, position) {
                          return _buildPageItem(
                            position,
                            popularProducts.popularProductList[position],
                          );
                          // return _buildPageItem(position,popularProducts.PopularProductList[position]);
                        }),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blueColor,
                    ),
                  );
          },
        ),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            // dotsCount: 5 ,
            // dotsCount: popularProducts.popularProductList.length,
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue.floor(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(top: Dimensions.height10),
          padding: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          child: Row(
            children: [
              Container(
                child: TextUtils(
                  text: "Recommended",
                  fontSize: Dimensions.font20,
                  color: AppColors.textColorBlack,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: TextUtils(
                  text: ".",
                  fontSize: Dimensions.font20,
                  color: AppColors.textColorBlack,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: TextUtils(
                  text: "Food Pairing",
                  fontSize: Dimensions.font15,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
        //list of food and image
        GetBuilder<RecommendedProductController>(
            // init: PopularProductController(popularProductRepo: ),
            builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width5,
                            bottom: Dimensions.height10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Image Section
                            Container(
                              height: Dimensions.listViewImageSize,
                              width: Dimensions.listViewImageSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radios10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProduct
                                                  .recommendedProductList[index]
                                                  .img!),
                                      // image: AssetImage(AppImages.food2),
                                      fit: BoxFit.cover),
                                  color: AppColors.shadowColorWhite),
                            ),
                            // Text Section
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radios20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radios20)),
                                    color: AppColors.shadowColorWhite),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextUtils(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontSize: Dimensions.font20),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      TextUtils(
                                        text:
                                            "productPopular.PopularProductList[index].name!",
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: Dimensions.font12,
                                        color: AppColors.textColor,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height20,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(
                  color: AppColors.blueColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index, "home"));
              //Get.toNamed(RouteHelper.getPopularFood());
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.height10,
                right: Dimensions.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radios20),
                color: index.isEven ? AppColors.mainColor : AppColors.blueColor,
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      popularProduct.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radios20),
                  color: AppColors.shadowColorWhite,
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(
                        color: AppColors.shadowColorWhite,
                        offset: Offset(-5, 0)),
                    BoxShadow(
                        color: AppColors.shadowColorWhite,
                        offset: Offset(5, 0)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.height15,
                      right: Dimensions.height15,
                      top: Dimensions.height10),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
