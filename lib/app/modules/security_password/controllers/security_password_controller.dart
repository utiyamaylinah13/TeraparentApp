import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityPasswordController extends GetxController {
  // =====================
  // TEXT FIELD
  // =====================
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // =====================
  // OBSURE PASSWORD
  // =====================
  var isCurrentObscure = true.obs;
  var isNewObscure = true.obs;
  var isConfirmObscure = true.obs;

  // =====================
  // TOGGLE
  // =====================
  var isBiometricEnabled = false.obs;
  var is2FAEnabled = false.obs;

  // =====================
  // SIMPLE UPDATE PASSWORD
  // =====================
  void updatePassword() {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Password tidak sama");
      return;
    }

    Get.snackbar("Success", "Password berhasil diubah");

    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}