import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _isLoading = false;
  Set<String> _removingItemIds = {};
  String? _errorMsg;
  String? _removeCartItemErrorMsg;

  String? get errorMsg => _errorMsg;
  String? get removeCartItemErrorMsg => _removeCartItemErrorMsg;

  bool get isLoading => _isLoading;
  

  List<CartItemModel> _cartitemList = [];

  List<CartItemModel> get cartItemList => _cartitemList;

  bool isCartItemRemoving(String cartId){
    return _removingItemIds.contains(cartId);
  }

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _isLoading = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.getCartListUrl,
    );

    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> data
          in response.responseBody!['data']['results']) {
        list.add(CartItemModel.fromJson(data));
      }
      _cartitemList.clear();
      _cartitemList.addAll(list);
      isSuccess = true;
      _errorMsg = null;
    } else {
      _errorMsg = response.errorMsg;
    }
    _isLoading = false;
    update();
    return isSuccess;
  }
  void updateCartItemQuantity(String cartId,int quantity){
    for(CartItemModel cartItemModel in _cartitemList){
      if(cartId== cartItemModel.id){
        cartItemModel.quantity=quantity;
      }
    }
    update();
  }
  Future<bool>removeFromCart(String cartId)async{
    bool isSuccess=false;
    _removingItemIds.add(cartId);
    update();
    NetworkResponse response =await Get.find<NetworkCaller>().deleteRequest(url: AppUrls.removeCartItemUrl(cartId));
    if(response.isSuccess){
      _cartitemList.removeWhere((e)=>e.id==cartId);
      isSuccess=true;
      _removeCartItemErrorMsg=null;
    }else{
      _removeCartItemErrorMsg=response.errorMsg;
    }
    _removingItemIds.remove(cartId);
    update();

    return isSuccess;
    
    
  }
  int get totalPrice{
    int price=0;
    for(CartItemModel cartItemModel in _cartitemList){
      price+=(cartItemModel.productModel.currentPrice*cartItemModel.quantity);
    }
    return price;
  }
}
