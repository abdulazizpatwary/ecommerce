import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/data/models/enum_tag.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductListByTagController extends GetxController {
  bool _isInitialLoading = true;
  bool _isLoading = false;
  String? _errorMsg;
  int _currentPage = 0;
  int? _totalPage;
  final int _pagePerCountData = 10;
  List<ProductModel> _newProductList = [];
  List<ProductModel> _specialProductList = [];
  List<ProductModel> _popularProductList = [];

  bool get isInitialLoading => _isInitialLoading;

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;

  int? get totalPage => _totalPage;

  int? get currentPage => _currentPage;

  List<ProductModel> get newProductList => _newProductList;

  List<ProductModel> get specialProductList => _specialProductList;

  List<ProductModel> get popularProductList => _popularProductList;

  Future<bool> getProductListByTag(ProductListTag tag) async {
    bool isSuccess = false;
    _currentPage++;
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }
    if (!isInitialLoading) {
      _isLoading = true;
    }
    update();
    Map<String, dynamic> queryParams = {
      'page': _currentPage,
      'count': _pagePerCountData,
      'tag': tag == ProductListTag.newProducts
          ? 'new'
          : tag == ProductListTag.specialProducts
          ? 'special'
          : 'popular',
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.productListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> data
          in response.responseBody!['data']['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _totalPage = response.responseBody!['data']['last_page'];
      if (queryParams['tag'] == 'new') {
        _newProductList.addAll(list);
      } else if (queryParams['tag'] == 'special') {
        _specialProductList.addAll(list);
      } else {
        _popularProductList.addAll(list);
      }
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

  Future<bool> onRefresh(ProductListTag tag) async {
    _currentPage = 0;
    _popularProductList.clear();
    _newProductList.clear();
    _specialProductList.clear();
    _totalPage = null;
    _isInitialLoading = true;
    return getProductListByTag(tag);
  }
}
