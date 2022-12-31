import 'dart:async';

import 'package:ecomm_food/controllers/popular_product_controller.dart';
import 'package:ecomm_food/controllers/recommended_product_controller.dart';
import 'package:ecomm_food/routes/route_helper.dart';
import 'package:ecomm_food/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();

    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/image/logo2.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/food.jpg",
              width: Dimensions.splashImg,
            ),
          ),
        ],
      ),
    );
  }
}
