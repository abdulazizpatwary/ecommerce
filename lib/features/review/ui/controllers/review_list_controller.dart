import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/review/data/review_item_model.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController{
  int _currentPage=0;
  final int _pagePerCountData=30;
  int? _totalPage;
  bool _isInitialLoading=true;
  bool _isLoading=false;
  String? _errorMsg;
  List<ReviewItemModel>_reviewList=[];


  bool get isLoading=>_isLoading;
  bool get isInitialLoading=>_isInitialLoading;
  String? get errorMsg=>_errorMsg;
  List<ReviewItemModel>get reviewList=>_reviewList;
  int? _totalReview;
  int ?get totalReview=>_totalReview;

  Future<bool>getReviewList(String productId)async{
    bool isSucces=false;
    _currentPage++;
    if(_totalPage!=null && _currentPage>_totalPage!)return true;
    if(!_isInitialLoading){
      _isLoading=true;
    }
    update();
    Map<String,dynamic>queryParams={
      "count":_pagePerCountData,
      "page":_currentPage,
      "product":productId
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: AppUrls.getReviewListUrl,queryParams: queryParams);
    if(response.isSuccess){
      List<ReviewItemModel>list=[];
      for(Map<String,dynamic>data in response.responseBody!['data']['results']){
        list.add(ReviewItemModel.fromJson(data));
      }
      _totalReview=response.responseBody!['data']['total'];
      _totalPage=response.responseBody!['data']['last_page'];
      _reviewList.addAll(list);
      isSucces=true;
      _errorMsg=null;


    }else{
      _errorMsg=response.errorMsg;

    }
    if(!_isInitialLoading){
      _isLoading=false;
    }else{
      _isInitialLoading=false;
    }
    update();


    return isSucces;

  }
}