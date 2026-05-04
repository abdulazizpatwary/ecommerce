import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _isLoading=false;
  String? _errorMsg;

  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;

  Future<bool>addToCart(String productId)async{
    bool isSuccess=false;
    _isLoading=true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: AppUrls.addToCartUrl, body: {'product':productId});
    if(response.isSuccess){

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