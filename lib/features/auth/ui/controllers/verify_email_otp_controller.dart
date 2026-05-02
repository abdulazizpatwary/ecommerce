import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/auth/data/models/verify_otp_request_model.dart';
import 'package:get/get.dart';

class VerifyEmailOtpController extends GetxController{
  bool _inProgress= false;
  String? _errorMsg;

  bool get inProgress=>_inProgress;
  String? get errorMsg=>_errorMsg;
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  Future<bool>verifyEmail(VerifyOtpRequestModel model)async{
    bool isSuccess= false;
    _inProgress=true;
    update();

    NetworkResponse response = await _networkCaller.postRequest(url: AppUrls.verifyOtpUrl, body:model.toJson());
    if(response.isSuccess){

      isSuccess=true;
      _errorMsg=null;
    }
    else{
      _errorMsg=response.errorMsg;
    }

    _inProgress=false;
    update();

    return isSuccess;

  }
}