import 'package:ecomm_food/controllers/auth_controller.dart';
import 'package:ecomm_food/controllers/cart_controller.dart';
import 'package:ecomm_food/controllers/location_controller.dart';
import 'package:ecomm_food/controllers/popular_product_controller.dart';
import 'package:ecomm_food/controllers/recommended_product_controller.dart';
import 'package:ecomm_food/controllers/user_controller.dart';
import 'package:ecomm_food/data/api/api_client.dart';
import 'package:ecomm_food/data/repository/auth_repo.dart';
import 'package:ecomm_food/data/repository/cart_repo.dart';
import 'package:ecomm_food/data/repository/location_repo.dart';
import 'package:ecomm_food/data/repository/popular_product_repo.dart';
import 'package:ecomm_food/data/repository/recommended_product_repo.dart';
import 'package:ecomm_food/data/repository/user_repo.dart';
import 'package:ecomm_food/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
