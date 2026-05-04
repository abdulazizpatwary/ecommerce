import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:get/get.dart';

class RemoveFromWishlistController extends GetxController {
  bool _isLoading = false;
  String? _errorMsg;

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;


  Future<bool> deleteFromWishList(String wishListItemId) async {
    final WishListController _wishListController= Get.find<WishListController>();
    bool isSuccess = false;
    _isLoading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
      url: AppUrls.deleteWishListItemUrl(wishListItemId),
    );
    if (response.isSuccess) {
      _wishListController.wishList.removeWhere((e)=>e.id==wishListItemId);
      _wishListController.update();

      isSuccess = true;
      _errorMsg = null;
    } else {
      _errorMsg = response.errorMsg;
    }
    _isLoading = false;
    update();

    return isSuccess;
  }
}
