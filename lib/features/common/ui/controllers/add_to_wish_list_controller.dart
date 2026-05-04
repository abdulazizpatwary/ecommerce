import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController{
  bool _isLoading=false;
  String? _errorMsg;
  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;
  Future<bool>addToWishList(String productId)async{
    final WishListController wishListController = Get.find<WishListController>();
    bool isSuccess=false;
    _isLoading=true;
    update();
    NetworkResponse response =await Get.find<NetworkCaller>().postRequest(url: AppUrls.addToWishListUrl, body: {'product':productId});

    if(response.isSuccess){
      wishListController.getWishList();
      wishListController.update();
      isSuccess=true;
      _errorMsg=null;
    }else{
      _errorMsg=response.errorMsg;
    }
    _isLoading=false;
    update();
    return isSuccess;
  }
}