import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controllers/cart-controller.dart';
import 'package:restaurant/controllers/popular_product_controller.dart';
import 'package:restaurant/controllers/recommended-product-controller.dart';
import 'package:restaurant/route/route-helper.dart';
import 'helper/dependencies.dart' as dep;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  // Get.put(CartController);
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            //home: const SplashScreen(),
            initialRoute: RouteHelper.getSplahPage(),
            getPages: RouteHelper.routes);
      });
    });
  }
}
