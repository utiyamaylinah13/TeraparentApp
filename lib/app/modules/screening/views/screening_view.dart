import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/modules/screening/views/questions/kognitif_sectionn.dart';
import 'package:teraparent_mobile/app/modules/screening/views/questions/pychical_motorik.dart';
import 'package:teraparent_mobile/app/modules/screening/views/questions/social_emotional_section.dart';
import '../controllers/screening_controller.dart';
import 'questions/communication_section.dart';

class ScreeningView extends GetView<ScreeningController> {
  const ScreeningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar icon untuk stepper di atas kuesioner
    final List<IconData> sectionIcons = [
      Icons.chat_bubble_outline,
      Icons.person_outline,
      Icons.lightbulb_outline,
      Icons.people_outline,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Background abu-abu soft super clean
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER & TITLE =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.previousPage(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2F1F4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.arrow_back, color: Color(0xFF2B7A8A)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Teraparent",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2B7A8A)),
                  ),
                ],
              ),
            ),

            // ================= PROGRESS BAR & LABEL =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SCREENING TAHAP 1",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey, letterSpacing: 1),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.currentSectionIndex.value == 0 ? "Communication & Speech" : controller.currentSectionIndex.value == 1 ? "Physical & Motoric" : controller.currentSectionIndex.value == 2 ? "Cognitive & Problem Solving" : "Social & Emotional",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      Text(
                        "${controller.progressPercentage.value}%",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2B7A8A)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: controller.progressPercentage.value / 100,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFE2E8F0),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF477A7A)),
                    ),
                  ),
                ],
              )),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Garis horizontal tipis di belakang bulatan
                  Container(height: 1, color: const Color(0xFFE2E8F0), margin: const EdgeInsets.symmetric(horizontal: 40)),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      bool isActive = controller.currentSectionIndex.value == index;
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.white : const Color(0xFFF1F5F9),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isActive ? const Color(0xFF2B7A8A) : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: isActive 
                              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]
                              : [],
                        ),
                        child: Icon(
                          sectionIcons[index],
                          color: isActive ? const Color(0xFF2B7A8A) : Colors.grey[400],
                        ),
                      );
                    }),
                  )),
                ],
              ),
            ),

            // ================= KONTEN INTERAKTIF (PAGE VIEW) =================
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(), // Mematikan geser manual swipe tangan
                children: const [
                  CommunicationSection(), // Index 0
                  PhysicalMotoricSection(), // Index 1
                  KognitifSection(), // Index 2
                  SocialEmotionalSection(), // Index 3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}