import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/core/theme/colors.dart';
import 'package:teraparent_mobile/app/modules/result_screening/controllers/result_screening_controller.dart';
import 'package:teraparent_mobile/app/routes/app_pages.dart';
import '../../../core/widgets/header_profile.dart';

class ResultScreeningView extends GetView<ResultScreeningController> {
  const ResultScreeningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            headerProfile(),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF477A7A), size: 16),
                const SizedBox(width: 6),
                Text(
                  "SCREENING TERAKHIR: 24 OKT 2023",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600], letterSpacing: 0.5),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Hasil Analisis",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 8),
            Text(
              "Berdasarkan observasi perilaku dan data perkembangan yang diunggah, berikut adalah rangkuman potensi kondisi Ananda.",
              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.4),
            ),
            const SizedBox(height: 20),
        
            // ================= CARD INDIKASI UTAMA =================
            _buildMainIndicationCard(),
        
            const SizedBox(height: 20),
        
            // ================= CARD DISTRIBUSI KEMUNGKINAN =================
            _buildDistributionCard(),
        
            const SizedBox(height: 28),
        
            // ================= SECTION REKOMENDASI AHLI =================
            _buildSectionHeader("Rekomendasi Ahli", "Langkah tepat untuk masa depan Ananda."),
            const SizedBox(height: 16),
            _buildExpertList(),
        
            const SizedBox(height: 28),
        
            // ================= SECTION METODE TERAPI =================
            _buildSectionHeader("Metode Terapi Terpilih", ""),
            const SizedBox(height: 16),
            _buildTherapyMethods(),
        
            const SizedBox(height: 28),
        
            // ================= BANNER AJAKAN PROGRAM TERAPI =================
            _buildProgramBanner(),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS UNTUK HALAMAN HASIL ---

  Widget _buildMainIndicationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7F7), // Hijau soft transparan
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFFE2F1F4), borderRadius: BorderRadius.circular(30)),
                child: const Text("INDIKASI UTAMA", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2B7A8A))),
              ),
              const Text("65%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E3A3A))),
            ],
          ),
          const SizedBox(height: 12),
          const Text("Speech Delay", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A4D57))),
          const SizedBox(height: 10),
          Text(
            "Ananda menunjukkan keterlambatan yang signifikan pada kemampuan bicara ekspresif dibandingkan usia sebaya. Meskipun kontak mata dan interaksi sosial dasar terlihat baik, perbendaharaan kata masih terbatas.",
            style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
          ),
          const SizedBox(height: 16),
          // Tag Label/Hashtag
          Row(
            children: [
              _buildChip("#KomunikasiEkspresif"),
              const SizedBox(width: 8),
              _buildChip("#BahasaReseptifNormal"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildDistributionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("DISTRIBUSI KEMUNGKINAN", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[400], letterSpacing: 0.5)),
          const SizedBox(height: 20),
          _buildProbabilityRow("Speech Delay", 0.65, "65%", const Color(0xFF2B7A8A)),
          const SizedBox(height: 16),
          _buildProbabilityRow("Autism Spectrum", 0.20, "20%", const Color(0xFF94A3B8)),
          const SizedBox(height: 16),
          _buildProbabilityRow("Tipikal (Wajar)", 0.15, "15%", const Color(0xFFA7E0D3)),
          const SizedBox(height: 20),
          // Info footer box mikrofon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                const Icon(Icons.mic, color: Color(0xFF2B7A8A), size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Data dikumpulkan melalui 12 indikator perkembangan perilaku motorik dan sosial.",
                    style: TextStyle(fontSize: 11, color: Colors.grey[600], height: 1.3),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProbabilityRow(String label, double percentage, String textValue, Color barColor) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
            Text(textValue, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 8,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
          ),
        )
      ],
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
            ]
          ],
        ),
        if (subtitle.isNotEmpty)
          TextButton(
            onPressed: () {},
            child: const Text("Lihat Semua", style: TextStyle(color: Color(0xFF2B7A8A), fontWeight: FontWeight.bold)),
          )
      ],
    );
  }

  Widget _buildExpertList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildExpertCard("Dr. Arini Sp.A", "Psikolog Anak & Tumbuh Kembang", "4.9 (120+ Sesi)", "Klinik Mentari, Jakarta Selatan", 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&q=80&w=150'),
          const SizedBox(width: 14),
          _buildExpertCard("Budi Santoso M.Psi", "Therapist Wicara Senior", "4.8 (90+ Sesi)", "Pusat Terapi Alsa, Bekasi", 'https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&q=80&w=150'),
        ],
      ),
    );
  }

  Widget _buildExpertCard(String name, String role, String rating, String location, String imgUrl) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 26, backgroundImage: NetworkImage(imgUrl)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F172A))),
                    const SizedBox(height: 2),
                    Text(role, style: TextStyle(fontSize: 11, color: Colors.grey[500]), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orangeAccent, size: 14),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey[400], size: 14),
              const SizedBox(width: 4),
              Expanded(child: Text(location, style: TextStyle(fontSize: 11, color: Colors.grey[500]), maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF0F7F7),
              foregroundColor: const Color(0xFF2B7A8A),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text("Atur Janji Temu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          )
        ],
      ),
    );
  }

  Widget _buildTherapyMethods() {
    return Row(
      children: [
        _buildMethodItem(Icons.volume_up_outlined, "Terapi Wicara"),
        const SizedBox(width: 14),
        _buildMethodItem(Icons.star_outline, "Terapi Bermain"),
      ],
    );
  }

  Widget _buildMethodItem(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: const Color(0xFFE2F1F4), shape: BoxShape.circle),
              child: Icon(icon, color: const Color(0xFF2B7A8A), size: 24),
            ),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2E5A5A), // Hijau gelap estetik sesuai mockup
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            "Siap untuk membantu\nAnanda berkembang?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
          ),
          const SizedBox(height: 10),
          Text(
            "Dapatkan program terapi mandiri di rumah yang dipersonalisasi khusus sesuai hasil screening hari ini.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.8), height: 1.4),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Get.offAllNamed(Routes.ACTIVITIES),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2E5A5A),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
            child: const Text("Mulai Program Terapi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          )
        ],
      ),
    );
  }
}