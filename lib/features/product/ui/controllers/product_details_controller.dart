import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _isLoading=false;
  String? _errorMsg;
  late ProductModel _productModel;
  
  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;
  ProductModel get productModel=>_productModel;
  Future<bool> getProductDetails({required String productId})async{
    bool isSuccess=false;
    _isLoading=true;
    update();
    
    NetworkResponse response= await Get.find<NetworkCaller>().getRequest(url: AppUrls.productDetailsUrl(productId));
    if(response.isSuccess){
      _productModel = ProductModel.fromJson(response.responseBody!['data']);
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