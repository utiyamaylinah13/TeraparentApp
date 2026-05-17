import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/routes/app_pages.dart';

class ActivitySuccessView extends StatelessWidget {
  const ActivitySuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF235A44);
    const progressColor = Color(0xFF2D6A4F);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 220,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(Icons.celebration, size: 100, color: Colors.orangeAccent),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("+50 Poin", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 14)),
                        Text("Skor Bonus", style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Hebat! Leo berhasil\nmenyelesaikan aktivitas!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor, height: 1.3),
              ),
              const SizedBox(height: 12),
              Text(
                "Ayah dan Bunda telah melakukan hal luar biasa hari ini bersama Leo. Mari rayakan langkah kecil ini!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.4),
              ),
              const SizedBox(height: 32),

              // Card Progres Motorik
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEAF4F0),
                          radius: 18,
                          child: Icon(Icons.gesture, color: primaryColor, size: 20),
                        ),
                        SizedBox(width: 12),
                        Text("Progres Motorik Halus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Koordinasi Tangan", style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                        const Text("+12%", style: TextStyle(fontWeight: FontWeight.bold, color: progressColor, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.72,
                        backgroundColor: Color(0xFFE0E0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                        minHeight: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "\"Leo menunjukkan peningkatan dalam memegang alat tulis dengan lebih stabil selama sesi mewarnai tadi.\"",
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[600], fontSize: 12, height: 1.4),
                    )
                  ],
                ),
              ),
              const Spacer(),

              // Aksi Navigasi GetX
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () => Get.toNamed(Routes.HOME), // Kembali ke dashboard/detail sebelumnya
                  child: const Text("Kembali ke Beranda", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.lightBlue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    backgroundColor: Colors.lightBlue.withOpacity(0.1),
                  ),
                  onPressed: () => Get.offAllNamed(Routes.GRAFIK_PERKEMBANGAN), // Navigasi ke halaman progres detail
                  icon: const Icon(Icons.bar_chart, color: Colors.lightBlue),
                  label: const Text("Lihat Progres", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}