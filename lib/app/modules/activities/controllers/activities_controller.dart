import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/data/models/activity_model.dart';
import 'package:teraparent_mobile/app/modules/activity_success/views/activity_success_view.dart';

class ActivitiesController extends GetxController {
  // State reactive untuk memantau loading data dari API
  var isLoading = true.obs;
  var activity = Rxn<ActivityModel>();

  @override
  void onInit() {
    super.onInit();
    fetchActivityDetail();
  }

  void fetchActivityDetail() async {
    try {
      isLoading(true);
      // TODO: Panggil repositori / hit endpoint Flask kamu di sini
      // Contoh: var result = await ActivityService.getDetail(id);
      
      // Simulasi data dummy dari backend sesuai mockup gambar kamu
      await Future.delayed(const Duration(milliseconds: 500));
      Map<String, dynamic> dummyJson = {
        "id": "act_001",
        "title": "Latihan Keseimbangan",
        "category": "Motorik Kasar",
        "duration": "15 Menit",
        "description": "Aktivitas berjalan di atas garis lurus untuk melatih koordinasi tubuh dan keseimbangan statis anak.",
        "objectives": ["Melatih keseimbangan tubuh", "Memperkuat otot kaki", "Meningkatkan fokus"],
        "tools": ["Selotip kertas"],
        "safety_tips": "Pastikan area sekitar bebas dari benda tajam dan lantai tidak licin. Gunakan selotip kertas untuk menghindari residu lem di lantai.",
        "steps": [
          "Buat garis lurus di lantai menggunakan selotip.",
          "Contohkan cara berjalan di atas garis dengan merentangkan tangan untuk keseimbangan.",
          "Ajak anak mencoba sambil memegang tangannya jika perlu, lalu lepaskan perlahan saat ia mulai stabil."
        ]
      };

      activity.value = ActivityModel.fromJson(dummyJson);
    } finally {
      isLoading(false);
    }
  }

  // Fungsi dinamis untuk menentukan warna tema berdasarkan tipe Motorik anak
  Color getCategoryColor() {
    switch (activity.value?.category) {
      case "Motorik Kasar":
        return const Color(0xFF235A44); // Hijau Tua khas Teraparent
      case "Motorik Halus":
        return const Color(0xFF40916C); // Hijau Sedang
      case "Komunikasi":
        return const Color(0xFF2A6F97); // Biru (seperti Flashcard Hewan)
      default:
        return const Color(0xFF235A44);
    }
  }

  void submitCompletion() {
    // Logika hit API Flask untuk menyimpan skor bonus anak (+50 Poin)
    // Setelah sukses, arahkan ke Halaman Sukses menggunakan Get.to()
    Get.to(() => ActivitySuccessView());
  }
}