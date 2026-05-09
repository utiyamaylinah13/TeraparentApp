import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isHidden = true.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  void login() {
    Get.snackbar(
      "Login",
      "Berhasil masuk",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
