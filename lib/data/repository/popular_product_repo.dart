// ignore_for_file: empty_constructor_bodies

import 'package:get/get.dart';
import 'package:restaurant/data/api/api_client.dart';
import 'package:restaurant/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    // return await apiClient.getData(AppConstants.PODUCTS_POPULAR_URL);
    return await apiClient.getData(AppConstants.PODUCTS_POPULAR_URL);
  }
}
