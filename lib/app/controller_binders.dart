import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/verify_email_otp_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/common/ui/controllers/category_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/home_slider_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/product_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeSliderController());
    Get.put(NetworkCaller(accessToken: Get.find<AuthController>().accessToken??'', unAuthorize: clearData));
    Get.put(MainBottomNavController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(VerifyEmailOtpController());
    Get.put(CategoryController());

  }
  Future<void>clearData()async{
    Get.find<AuthController>().clearUserData();
    Get.offAllNamed(SignInScreen.name);
  }
}