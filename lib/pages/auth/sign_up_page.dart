import 'package:ecomm_food/base/custom_loader.dart';
import 'package:ecomm_food/base/show_custome_snackbar.dart';
import 'package:ecomm_food/controllers/auth_controller.dart';
import 'package:ecomm_food/models/signup_body_model.dart';
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid Email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than six character",
            title: "password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ? SingleChildScrollView(
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
                      icon: Icons.password,
                      isObscure: true,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //name
                    AppTextField(
                        textController: nameController,
                        hintText: "Name",
                        icon: Icons.person),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AppTextField(
                        textController: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimensions.height20 + Dimensions.height20,
                    ),
                    //sign up button
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor),
                        child: Center(
                            child: BigText(
                                text: "Sign Up",
                                size:
                                    Dimensions.font20 + Dimensions.font16 / 2)),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //tagline
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an account already?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    //sign up option
                    RichText(
                      text: TextSpan(
                        text: "Sing up using one of the following method?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: Dimensions.radius30,
                            backgroundImage: AssetImage(
                              "assets/image/" + signUpImages[index],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
