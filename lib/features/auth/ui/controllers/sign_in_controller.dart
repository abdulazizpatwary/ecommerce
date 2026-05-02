import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/auth/data/models/sign_in_requests_model.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  bool _inProgress=false;
  String? _errorMsg;

  bool get inProgress=>_inProgress;
  String? get errorMsg=>_errorMsg;
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();
  final AuthController _authController = Get.find<AuthController>();

  Future<bool>signIn(SignInRequestModel model)async{
    bool isSuccess=false;
    _inProgress=true;
    update();

    NetworkResponse response =await _networkCaller.postRequest(url: AppUrls.signInUrl, body: model.toJson());
    if(response.isSuccess){
      String token=response.responseBody!['data']['token'];
      UserModel model = UserModel.fromJson(response.responseBody!['data']['user']);
      await _authController.saveUserData(token, model);



      _errorMsg=null;
      isSuccess=true;
    }else{
      _errorMsg=response.errorMsg;
    }
    _inProgress=false;
    update();

    return isSuccess;
  }
}