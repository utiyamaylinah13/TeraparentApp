import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class VerifyOtpController extends GetxController {
  final otpControllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());

  final isLoading = false.obs;
  final secondsLeft = 60.obs;
  final email = ''.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args != null && args is Map && args['email'] != null) {
      email.value = args['email'].toString();
    } else {
      email.value = 'emailanda@gmail.com';
    }

    startTimer();
  }

  void startTimer() {
    secondsLeft.value = 60;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  String getOtpCode() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void clearOtp() {
    for (final controller in otpControllers) {
      controller.clear();
    }

    focusNodes.first.requestFocus();
  }

  Future<void> verifyOtp() async {
    final otp = getOtpCode();

    if (otp.length < 6) {
      Get.snackbar(
        'Kode belum lengkap',
        'Masukkan 6 digit kode OTP terlebih dahulu',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    // Nanti bagian ini diganti setelah connect ke backend.
    // Kalau OTP benar, masuk ke halaman animasi sukses.
    Get.offNamed(Routes.VERIFY_SUCCESS);
  }

  void resendOtp() {
    if (secondsLeft.value > 0) return;

    clearOtp();
    startTimer();

    Get.snackbar(
      'OTP dikirim ulang',
      'Kode OTP baru telah dikirim ke email Anda',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();

    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.onClose();
  }
}