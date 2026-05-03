import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/common/data/models/category_item_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _isLoading=false;
  bool _isInitialLoading=true;
  String? _errorMsg;

  int _currentPage=0;
  final int _pagePerCount=30;

  int? _totalPage;

  int ? get totalPage=>_totalPage;
  int ? get currentPage=>_currentPage;

  bool get isInitialLoading=>_isInitialLoading;
  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;

  List<CategoryItemModel>_categoryList=[];
  List<CategoryItemModel>get categoryList=>_categoryList;

  Future<bool> getCategoryList()async{
    bool isSuccess=false;
    _currentPage++;
    if(_totalPage !=null && _currentPage>_totalPage!){return true;}
    if(!_isInitialLoading){
      _isLoading=true;
    }
    update();
    Map<String,dynamic>queryParams={
      'page':_currentPage,
      'count':_pagePerCount
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: AppUrls.categoriesUrl,queryParams: queryParams);
    if(response.isSuccess){

      _totalPage=response.responseBody!['data']['total_page'];
      List<CategoryItemModel>list=[];
      for(Map<String,dynamic>data in response.responseBody!['data']['results']){
        list.add(CategoryItemModel.fromJson(data));
      }
      _categoryList.addAll(list);
      isSuccess=true;
      _errorMsg=null;
    }else {
      _errorMsg = response.errorMsg;
    }
    if(!_isInitialLoading){
      _isLoading=false;
    }else{
      _isInitialLoading=false;
    }
    update();

    return isSuccess;
  }
Future<bool>onRefresh()async{
    _totalPage=null;
    _currentPage=0;
    _categoryList=[];
    _isInitialLoading=true;
    return await getCategoryList();
}
}