import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network/network_caller.dart';
import 'package:ecommerce/core/network/network_response.dart';
import 'package:ecommerce/features/review/data/review_item_model.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  bool _isLoading = false;
  String? _errorMsg;
  List<ReviewItemModel> _reviewList = [];

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;

  List<ReviewItemModel> get reviewList => _reviewList;
  int? _totalReview;

  int? get totalReview => _totalReview;

  Future<bool> getReviewList(String productId) async {
    bool isSuccess = false;

    _isLoading = true;

    update();
    Map<String, dynamic> queryParams = {"product": productId};
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.getReviewListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      List<ReviewItemModel> list = [];
      for (Map<String, dynamic> data
          in response.responseBody!['data']['results']) {
        list.add(ReviewItemModel.fromJson(data));
      }
      _totalReview = response.responseBody!['data']['total'];
      _reviewList.clear();

      _reviewList.addAll(list);
      isSuccess = true;
      _errorMsg = null;
    } else {
      _errorMsg = response.errorMsg;
    }

    _isLoading = false;
    update();

    return isSuccess;
  }
}
