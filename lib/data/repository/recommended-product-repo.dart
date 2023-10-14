// ignore_for_file: empty_constructor_bodies

import 'package:get/get.dart';
import 'package:restaurant/data/api/api_client.dart';
import 'package:restaurant/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    // return await apiClient.getData(AppConstants.PODUCTS_POPULAR_URL);
    return await apiClient.getData(AppConstants.Recommended_POPULAR_URL);
  }
}
