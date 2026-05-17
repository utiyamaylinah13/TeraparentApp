import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/screening_controller.dart';
import '../../../../core/widgets/tips_card.dart';

  class SocialEmotionalSection extends GetView<ScreeningController> {
  const SocialEmotionalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2F1F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("01", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B7A8A))),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text(
                      "Apakah anak sudah dapat berjalan tegak sendiri di lantai rata tanpa terhuyung-huyung atau berpegangan?",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1E293B), height: 1.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Pilihan Opsi Jawaban
              _buildOption(questionId: "q_01", value: "Sering"),
              _buildOption(questionId: "q_01", value: "Kadang-kadang"),
              _buildOption(questionId: "q_01", value: "Tidak Pernah"),
            ],
          ),
        ),
        
        const SizedBox(height: 20),

        // ----------- KARTU PERTANYAAN 02 -----------
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2F1F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("02", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B7A8A))),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text(
                      "Apakah anak bisa menaiki anak tangga secara mandiri, meskipun masih berpegangan pada dinding atau susuran tangga?",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1E293B), height: 1.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildOption(questionId: "q_02", value: "Sering"),
              _buildOption(questionId: "q_02", value: "Kadang-kadang"),
              _buildOption(questionId: "q_02", value: "Tidak Pernah"),
            ],
          ),
        ),

        const SizedBox(height: 24),
        
        // Komponen Reusable Tips Card
        const TipsCard(
          text: "Lakukan observasi santai saat anak bermain untuk hasil yang lebih akurat.",
        ),

        const SizedBox(height: 24),

        // Tombol Next Halaman
        Obx(
          () => ElevatedButton(
              onPressed: controller.isSubmitting.value ? null : () => controller.submitAnswers(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B7A8A),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: controller.isSubmitting.value
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Text("Submit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
        ),

      ],
    );
  }

  // Widget builder helper untuk list pilihan jawaban radio custom mirip desain UI
  Widget _buildOption({required String questionId, required String value}) {
    return Obx(() {
      bool isSelected = controller.selectedAnswers[questionId] == value;
      return GestureDetector(
        onTap: () => controller.selectOption(questionId, value),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF0F7F7) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? const Color(0xFF2B7A8A) : const Color(0xFFE2E8F0),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? const Color(0xFF1A4D57) : const Color(0xFF475569),
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: Color(0xFF2B7A8A))
              else
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFCBD5E1), width: 1.5),
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}