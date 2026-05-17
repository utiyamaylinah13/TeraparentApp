import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/routes/app_pages.dart';

class ScreeningController extends GetxController {
  final PageController pageController = PageController();
  
  // State halaman kuesioner aktif (0 = Komunikasi, 1 = Fisik, dst)
  var currentSectionIndex = 0.obs;
  var progressPercentage = 20.obs;
  var selectedAnswers = <String, String>{}.obs;
  var isSubmitting = false.obs;

  void selectOption(String questionId, String optionValue) {
    selectedAnswers[questionId] = optionValue;
  }

  void nextPage() {
    if (currentSectionIndex.value < 3) { // Asumsi total ada 4 kategori kuesioner
      currentSectionIndex.value++;
      progressPercentage.value += 20; // Progress naik bertahap
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      submitAnswers();
    }
  }

  void previousPage() {
    if (currentSectionIndex.value > 0) {
      currentSectionIndex.value--;
      progressPercentage.value -= 20;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back(); // Keluar dari halaman screening jika di page pertama
    }
  }

  Future<void> submitAnswers() async {
    isSubmitting.value = true;
    await Future.delayed(
        const Duration(seconds: 2),
     );
    Get.snackbar(
      "Sukses", 
      "Data kuesioner berhasil dikirim!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      colorText: Colors.white,
    );

    Get.offAllNamed(Routes.RESULT_SCREENING);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}