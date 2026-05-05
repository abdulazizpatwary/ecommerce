import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/controllers/verify_email_otp_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/category_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/home_slider_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/product_list_by_tag_controller.dart';
import 'package:ecommerce/features/review/ui/controllers/create_review_controller.dart';
import 'package:ecommerce/features/wish/controller/remove_from_wishlist_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeSliderController());
    Get.put(NetworkCaller( accessToken: () =>Get.find<AuthController>().accessToken??'',unAuthorize: clearData,));
    Get.put(MainBottomNavController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(VerifyEmailOtpController());
    Get.put(CategoryController());
    Get.put(ProductListByTagController());
    Get.put(CartListController());
    Get.lazyPut(()=>AddToWishListController());
    Get.put(WishListController());
    Get.put(RemoveFromWishlistController());
    Get.put(CreateReviewController());

  }
  Future<void>clearData()async{
    Get.find<AuthController>().clearUserData();
    Get.offAllNamed(SignInScreen.name);
  }
}