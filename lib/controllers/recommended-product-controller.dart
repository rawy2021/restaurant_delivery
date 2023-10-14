// ignore_for_file: null_check_always_fails
import 'package:get/get.dart';
import 'package:restaurant/data/repository/recommended-product-repo.dart';
import 'package:restaurant/model/product_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    try {
      if (response.statusCode == 200) {
        //print("Got Products");
        _recommendedProductList = [];
        _recommendedProductList
            .addAll(Product.fromJson(response.body).products);
        //print(_popularProductList);
        _isLoaded = true;
        update();
      } else {}
    } catch (e) {
      print('Error: $e');
    }
  }
}
