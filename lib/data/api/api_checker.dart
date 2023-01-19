import 'package:ecomm_food/base/show_custome_snackbar.dart';
import 'package:ecomm_food/routes/route_helper.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.offNamed(RouteHelper.getSignInPage());
    } else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
