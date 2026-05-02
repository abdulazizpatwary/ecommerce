import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/home/data/models/slide_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _inProgress=false;
  String? _errorMsg;
  bool get inProgress=>_inProgress;
  String? get errorMsg=>_errorMsg;
  
  List<SlideModel>_sliderList=[];
  List<SlideModel>get sliderList=>_sliderList;
  
  Future<bool>getSliderList()async{
    bool isSuccess=false;
    _inProgress=true;
    update();
    NetworkResponse response =await Get.find<NetworkCaller>().getRequest(url: AppUrls.sliderUrl);
    if(response.isSuccess){
      List<SlideModel>list=[];
      for(Map<String,dynamic>data in response.responseBody!['data']['results']){
        list.add(SlideModel.fromJson(data));
      }
      _sliderList=list;
      isSuccess=true;
      _errorMsg=null;
    }else{
      _errorMsg =response.errorMsg;
    }
    _inProgress =false;
    update();
    
    return isSuccess;
  }
  
}