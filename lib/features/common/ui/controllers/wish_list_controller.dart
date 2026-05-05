import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/wish/data/wish_list_item_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _isLoading = false;
  String? _errorMsg;
  List<WishListItemModel> _wishList = [];

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;

  List<WishListItemModel> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;

    _isLoading = true;

    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.getWishListUrl,
    );

    if (response.isSuccess) {
      List<WishListItemModel> list = [];
      for (Map<String, dynamic> data
          in response.responseBody!['data']['results']) {
        list.add(WishListItemModel.fromJson(data));
      }
      _wishList.clear();
      _wishList.addAll(list);
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
