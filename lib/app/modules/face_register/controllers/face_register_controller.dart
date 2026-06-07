import 'dart:async';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';

class FaceRegisterController extends GetxController {
  CameraController? cameraController;

  final isCameraReady = false.obs;
  final isScanning = false.obs;
  final isSaving = false.obs;
  final isFaceReady = false.obs;
  final hasError = false.obs;

  final scanProgress = 0.0.obs;
  final statusText = 'Menyiapkan kamera...'.obs;
  final errorMessage = ''.obs;

  Timer? _scanTimer;

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
      statusText.value = 'Posisikan wajah di dalam frame';

      startRealtimeEnrollment();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Gagal membuka kamera: $e';
      statusText.value = 'Terjadi kesalahan kamera';
    }
  }

  void startRealtimeEnrollment() {
    isScanning.value = true;
    isFaceReady.value = false;
    scanProgress.value = 0;
    statusText.value = 'Memindai wajah...';

    _scanTimer?.cancel();

    _scanTimer = Timer.periodic(
      const Duration(milliseconds: 350),
      (timer) {
        if (scanProgress.value >= 1.0) {
          timer.cancel();

          isScanning.value = false;
          isFaceReady.value = true;
          statusText.value = 'Wajah berhasil dipindai';
          return;
        }

        scanProgress.value += 0.08;

        if (scanProgress.value < 0.35) {
          statusText.value = 'Lihat ke arah kamera';
        } else if (scanProgress.value < 0.7) {
          statusText.value = 'Pastikan wajah tetap di frame';
        } else {
          statusText.value = 'Hampir selesai...';
        }
      },
    );
  }

  void rescanFace() {
    startRealtimeEnrollment();
  }

  Future<void> saveFace() async {
    if (!isFaceReady.value) {
      Get.snackbar(
        'Belum Selesai',
        'Tunggu sampai proses pemindaian wajah selesai',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isSaving.value = true;

    await Future.delayed(const Duration(seconds: 1));

    /*
      NANTI BAGIAN INI DIGANTI DENGAN API BACKEND EXPRESS.

      Contoh:
      POST /api/auth/register-face

      Data yang dikirim bisa berupa:
      - user_id
      - face embedding
      - token login
    */

    isSaving.value = false;

    Get.snackbar(
      'Berhasil',
      'Data wajah berhasil didaftarkan',
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed(Routes.FACE_LOGIN);
  }

  void retryCamera() {
    isCameraReady.value = false;
    hasError.value = false;
    errorMessage.value = '';
    scanProgress.value = 0;
    isFaceReady.value = false;

    _scanTimer?.cancel();
    cameraController?.dispose();
    cameraController = null;

    initCamera();
  }

  @override
  void onClose() {
    _scanTimer?.cancel();
    cameraController?.dispose();
    super.onClose();
  }
}