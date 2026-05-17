import 'package:get/get.dart';

import '../controllers/detail_activity_controller.dart';

class DetailActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailActivityController>(
      () => DetailActivityController(),
    );
  }
}
