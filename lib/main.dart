import 'package:ecomm_food/controllers/cart_controller.dart';
import 'package:ecomm_food/controllers/popular_product_controller.dart';
import 'package:ecomm_food/controllers/recommended_product_controller.dart';
import 'package:ecomm_food/pages/auth/sign_in_page.dart';
import 'package:ecomm_food/pages/auth/sign_up_page.dart';
import 'package:ecomm_food/pages/food/food_detail.dart';
import 'package:ecomm_food/pages/food/recommended_food_detail.dart';
import 'package:ecomm_food/pages/home/food_page_body.dart';
import 'package:ecomm_food/pages/home/main_food_page.dart';
import 'package:ecomm_food/pages/splash/splash_page.dart';
import 'package:ecomm_food/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependecies.dart' as dep;
import 'pages/cart/cart_page.dart';

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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInPage(),
          //home: SignUpPage(),

          //home: SplashScreen(),
          //initialRoute: RouteHelper.splashPage,
          //getPages: RouteHelper.routes,
        );
      });
    });
  }
}
