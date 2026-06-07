import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/core/theme/colors.dart';

import '../controllers/face_register_controller.dart';

class FaceRegisterView extends GetView<FaceRegisterController> {
  const FaceRegisterView({super.key});

  double responsive(
    double width,
    double value, {
    double min = 0,
    double max = double.infinity,
  }) {
    return (width * value).clamp(min, max).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final horizontalPadding = responsive(width, 0.065, min: 22, max: 34);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -height * 0.12,
            right: -width * 0.22,
            child: Container(
              width: width * 0.72,
              height: width * 0.72,
              decoration: BoxDecoration(
                color: AppColors.softGreen.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -height * 0.13,
            left: -width * 0.25,
            child: Container(
              width: width * 0.75,
              height: width * 0.75,
              decoration: BoxDecoration(
                color: AppColors.softGreen.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: responsive(width, 0.04, min: 14, max: 24)),

                        Row(
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                width: responsive(width, 0.12, min: 42, max: 48),
                                height: responsive(width, 0.12, min: 42, max: 48),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: responsive(width, 0.05, min: 18, max: 28)),

                        Text(
                          'Registrasi Wajah',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: responsive(width, 0.07, min: 25, max: 31),
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Kamera akan memindai wajah secara otomatis.\nTidak perlu menekan tombol jepret.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: responsive(width, 0.037, min: 13, max: 16),
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),

                        SizedBox(height: responsive(width, 0.07, min: 24, max: 34)),

                        Obx(
                          () {
                            if (controller.hasError.value) {
                              return _errorCard(width);
                            }

                            return _cameraCard(width);
                          },
                        ),

                        SizedBox(height: responsive(width, 0.06, min: 22, max: 32)),

                        Obx(
                          () => Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 14,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      controller.isFaceReady.value
                                          ? Icons.check_circle_rounded
                                          : Icons.face_retouching_natural_rounded,
                                      color: AppColors.primary,
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Text(
                                        controller.statusText.value,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: LinearProgressIndicator(
                                    value: controller.scanProgress.value.clamp(0.0, 1.0),
                                    minHeight: 9,
                                    backgroundColor: const Color(0xFFE9F3EE),
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: controller.isFaceReady.value &&
                                      !controller.isSaving.value
                                  ? controller.saveFace
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                disabledBackgroundColor: AppColors.primary.withOpacity(0.35),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: controller.isSaving.value
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      'Simpan Data Wajah',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: OutlinedButton(
                              onPressed: controller.isScanning.value
                                  ? null
                                  : controller.rescanFace,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppColors.primary,
                                  width: 1.3,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text(
                                'Scan Ulang',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const Text(
                          'Gunakan pencahayaan cukup dan pastikan wajah terlihat jelas.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black45,
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraCard(double width) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        responsive(width, 0.045, min: 16, max: 22),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Obx(
        () {
          if (!controller.isCameraReady.value ||
              controller.cameraController == null ||
              !controller.cameraController!.value.isInitialized) {
            return SizedBox(
              height: responsive(width, 0.92, min: 330, max: 410),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            );
          }

          return Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: SizedBox(
                  width: double.infinity,
                  height: responsive(width, 0.92, min: 330, max: 410),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.cameraController!.value.previewSize!.height,
                      height: controller.cameraController!.value.previewSize!.width,
                      child: CameraPreview(controller.cameraController!),
                    ),
                  ),
                ),
              ),

              Container(
                width: responsive(width, 0.58, min: 220, max: 270),
                height: responsive(width, 0.72, min: 260, max: 320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
              ),

              Positioned(
                top: 22,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Pendaftaran Realtime',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _errorCard(double width) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: responsive(width, 0.16, min: 56, max: 72),
            color: AppColors.primary,
          ),

          const SizedBox(height: 16),

          const Text(
            'Kamera Tidak Aktif',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 8),

          Obx(
            () => Text(
              controller.errorMessage.value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: controller.retryCamera,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Coba Lagi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}