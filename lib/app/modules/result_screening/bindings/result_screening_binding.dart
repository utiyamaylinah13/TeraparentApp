import 'package:get/get.dart';

import '../controllers/result_screening_controller.dart';

class ResultScreeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultScreeningController>(
      () => ResultScreeningController(),
    );
  }
}
