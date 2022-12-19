import 'package:ecomm_food/controllers/popular_product_controller.dart';
import 'package:ecomm_food/controllers/recommended_product_controller.dart';
import 'package:ecomm_food/pages/food/food_detail.dart';
import 'package:ecomm_food/pages/food/recommended_food_detail.dart';
import 'package:ecomm_food/pages/home/food_page_body.dart';
import 'package:ecomm_food/pages/home/main_food_page.dart';
import 'package:ecomm_food/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependecies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
