import 'dart:async';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';

class FaceLoginController extends GetxController {
  CameraController? cameraController;

  final isCameraReady = false.obs;
  final isVerifying = false.obs;
  final isMatched = false.obs;
  final hasError = false.obs;

  final statusText = 'Menyiapkan kamera...'.obs;
  final errorMessage = ''.obs;

  Timer? _verificationTimer;
  int _scanCounter = 0;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      hasError.value = false;
      statusText.value = 'Meminta izin kamera...';

      final permission = await Permission.camera.request();

      if (!permission.isGranted) {
        hasError.value = true;
        errorMessage.value = 'Izin kamera ditolak. Aktifkan izin kamera terlebih dahulu.';
        statusText.value = 'Kamera tidak dapat digunakan';
        return;
      }

      statusText.value = 'Membuka kamera depan...';

      final cameras = await availableCameras();

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController!.initialize();

      isCameraReady.value = true;
      statusText.value = 'Hadapkan wajah ke kamera';

      startRealtimeVerification();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Gagal membuka kamera: $e';
      statusText.value = 'Terjadi kesalahan kamera';
    }
  }

  void startRealtimeVerification() {
    _verificationTimer?.cancel();

    _verificationTimer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        if (isVerifying.value || isMatched.value || !isCameraReady.value) {
          return;
        }

        await verifyFaceRealtime();
      },
    );
  }

  Future<void> verifyFaceRealtime() async {
    try {
      isVerifying.value = true;
      statusText.value = 'Memindai wajah...';

      await Future.delayed(const Duration(milliseconds: 900));

      statusText.value = 'Mencocokkan dengan database...';

      await Future.delayed(const Duration(milliseconds: 900));

      /*
        NANTI BAGIAN INI DIGANTI DENGAN API BACKEND EXPRESS.

        Contoh alurnya:
        1. Ambil frame wajah dari kamera.
        2. Kirim ke backend Express.
        3. Backend membuat face embedding.
        4. Backend membandingkan embedding dengan database.
        5. Kalau cocok, backend mengembalikan success true + token.
      */

      _scanCounter++;

      // DUMMY:
      // Anggap setelah 3 kali scan wajah cocok.
      final bool faceMatch = _scanCounter >= 3;

      if (faceMatch) {
        isMatched.value = true;
        statusText.value = 'Wajah cocok. Login berhasil...';

        await Future.delayed(const Duration(seconds: 1));

        Get.offAllNamed(Routes.HOME);
      } else {
        statusText.value = 'Pastikan wajah terlihat jelas';
      }
    } catch (e) {
      statusText.value = 'Gagal memverifikasi wajah';
    } finally {
      isVerifying.value = false;
    }
  }

  void retryCamera() {
    _scanCounter = 0;
    isMatched.value = false;
    isCameraReady.value = false;
    hasError.value = false;
    errorMessage.value = '';

    _verificationTimer?.cancel();
    cameraController?.dispose();
    cameraController = null;

    initCamera();
  }

  @override
  void onClose() {
    _verificationTimer?.cancel();
    cameraController?.dispose();
    super.onClose();
  }
}