import 'package:ecomm_food/controllers/popular_product_controller.dart';
import 'package:ecomm_food/controllers/recommended_product_controller.dart';
import 'package:ecomm_food/data/api/api_client.dart';
import 'package:ecomm_food/data/repository/popular_product_repo.dart';
import 'package:ecomm_food/data/repository/recommended_product_repo.dart';
import 'package:ecomm_food/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
