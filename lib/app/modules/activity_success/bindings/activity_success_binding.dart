import 'package:get/get.dart';

import '../controllers/activity_success_controller.dart';

class ActivitySuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitySuccessController>(
      () => ActivitySuccessController(),
    );
  }
}
