import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  int _currentPage = 0;
  final int _pageCount = 30;
  int? _totalPage;
  bool _isInitialLoading = true;
  bool _isLoading = false;
  String? _errorMsg;
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  bool get isInitialLoading => _isInitialLoading;

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;

  Future<bool> getProductList(String categoryId) async {
    bool isSuccess = false;
    _currentPage++;
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }
    if (!_isInitialLoading) {
      _isLoading = true;
    }
    update();
    Map<String, dynamic> queryParams = {
      'page': _currentPage,
      'count': _pageCount,
      'category': categoryId,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.productListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String,dynamic>data in response.responseBody!['data']['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);
      _totalPage = response.responseBody!['data']['last_page'];
      isSuccess = true;
      _errorMsg = null;
    } else {
      _errorMsg = response.errorMsg;
    }
    if (!_isInitialLoading) {
      _isLoading = false;
    } else {
      _isInitialLoading = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> onRefresh(String id) async {
    _currentPage = 0;
    _productList = [];
    _totalPage = null;
    _isInitialLoading = true;
    return getProductList(id);
  }
}
