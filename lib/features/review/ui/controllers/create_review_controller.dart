import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/review/ui/controllers/review_list_controller.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _isLoading=false;
  String?_errorMsg;
  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;
  
  Future<bool>createReview(Map<String,dynamic>body)async{
    ReviewListController reviewListController =Get.find<ReviewListController>();
    bool isSuccess=false;
    _isLoading=true;
    update();

    
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: AppUrls.createReviewUrl, body: body);
    if(response.isSuccess){
      reviewListController.getReviewList(body['product']);
      reviewListController.update();
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