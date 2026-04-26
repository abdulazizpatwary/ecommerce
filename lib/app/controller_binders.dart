import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}