import 'package:get/get.dart';
import 'package:restaurant/controllers/cart-controller.dart';
import 'package:restaurant/controllers/popular_product_controller.dart';
import 'package:restaurant/controllers/recommended-product-controller.dart';
import 'package:restaurant/data/api/api_client.dart';
import 'package:restaurant/data/repository/cart-repo.dart';
import 'package:restaurant/data/repository/popular_product_repo.dart';
import 'package:restaurant/data/repository/recommended-product-repo.dart';
import 'package:restaurant/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
