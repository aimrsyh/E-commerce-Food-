import 'package:ecomm_food/pages/auth/sign_up_page.dart';
import 'package:ecomm_food/pages/home/main_food_page.dart';
import 'package:ecomm_food/utils/colors.dart';
import 'package:ecomm_food/utils/dimensions.dart';
import 'package:ecomm_food/widgets/app_text_field.dart';
import 'package:ecomm_food/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/image/logo1.jpg",
                  ),
                ),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your accunt",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16 + Dimensions.font20 / 2,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),
            ),
            //email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            //password
            AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password),
            SizedBox(
              height: Dimensions.height20,
            ),

            //tagline
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account ",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font20),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20,
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),

            //sign up button
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                  child: BigText(
                      text: "Sign In",
                      size: Dimensions.font20 + Dimensions.font20 / 2)),
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //sign up option
            RichText(
              text: TextSpan(
                text: "Don't have an acocunt?",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font20),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          Get.to(SignUpPage(), transition: Transition.fade),
                    text: " Create",
                    style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
