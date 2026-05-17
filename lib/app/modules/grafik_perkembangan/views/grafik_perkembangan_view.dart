import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart
import 'package:teraparent_mobile/app/core/theme/colors.dart';
import 'package:teraparent_mobile/app/core/widgets/bottom_nav.dart';
import 'package:teraparent_mobile/app/core/widgets/header_profile.dart';
import '../controllers/grafik_perkembangan_controller.dart';

class GrafikPerkembanganView extends GetView<GrafikPerkembanganController> {
  const GrafikPerkembanganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerProfile(),
              const SizedBox(height: 24),
              _buildHighlightCard(),
              const SizedBox(height: 16),
              _buildRadarCard(),
              const SizedBox(height: 16),
              _buildMilestonesCard(),
              const SizedBox(height: 16),
              _buildGrowthChartCard(),
              const SizedBox(height: 16),
              _buildTipsCard(),
              const SizedBox(height: 80), // Jarak aman untuk bottom navbar
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  // 1. Banner Hebat
  Widget _buildHighlightCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F5EE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome, color: Color(0xFF2E7D32), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wah, Hebat!",
                  style: TextStyle(
                    color: Color(0xFF0F3A20),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${controller.childName} menunjukkan kemajuan luar biasa di aspek Motorik Halus minggu ini.",
                  style: const TextStyle(
                    color: Color(0xFF2E5A44),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. Radar Perkembangan Placeholder
  Widget _buildRadarCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Radar Perkembangan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F3A20),
                ),
              ),
              Icon(Icons.info_outline, color: Colors.grey.shade400, size: 20),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 220,
            child: RadarChart(
              RadarChartData(
                dataSets: [
                  RadarDataSet(
                    fillColor: const Color(0xFF147A6A).withOpacity(0.4),
                    borderColor: const Color(0xFF0F3A20),
                    entryRadius: 3,
                    borderWidth: 2,
                    dataEntries: controller.radarValues
                        .map((e) => RadarEntry(value: e))
                        .toList(),
                  ),
                ],
                radarShape: RadarShape.polygon,
                // Menggunakan border dasar fl_chart modern
                gridBorderData: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                tickBorderData: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                tickCount: 3,
                titlePositionPercentageOffset: 0.15,
                // Solusi jitu: definisikan 2 parameter dan return objek RadarChartTitle dengan properti style
                getTitle: (index, angle) {
                  return RadarChartTitle(text: controller.radarFeatures[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Milestones Terbaru
  Widget _buildMilestonesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Milestones Terbaru",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3A20),
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.milestones.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = controller.milestones[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFFD1E7DD),
                      child: Icon(
                        index == 0
                            ? Icons.widgets
                            : index == 1
                            ? Icons.record_voice_over
                            : Icons.people,
                        color: const Color(0xFF0F3A20),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            item['date']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Lihat Semua Pencapaian",
                style: TextStyle(
                  color: Color(0xFF2A7A4C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. Grafik Pertumbuhan & Info Fisik
  Widget _buildGrowthChartCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Grafik Pertumbuhan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3A20),
            ),
          ),
          const Text(
            "Berat & Tinggi Badan (6 Bulan Terakhir)",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Line Chart nya di sini
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        List<String> months = [
                          'Mei',
                          'Jun',
                          'Jul',
                          'Agu',
                          'Sep',
                          'Okt',
                        ];
                        if (value.toInt() >= 0 &&
                            value.toInt() < months.length) {
                          return Text(
                            months[value.toInt()],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  // Garis Hijau (Tinggi Badan)
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 3.2),
                      FlSpot(2, 3.1),
                      FlSpot(3, 3.5),
                      FlSpot(4, 4.2),
                      FlSpot(5, 4.0),
                    ],
                    isCurved: true,
                    color: const Color(0xFF0F3A20),
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                  // Garis Cokelat (Berat Badan)
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1),
                      FlSpot(1, 1.2),
                      FlSpot(2, 1.1),
                      FlSpot(3, 1.3),
                      FlSpot(4, 1.5),
                      FlSpot(5, 2.0),
                    ],
                    isCurved: true,
                    color: const Color(0xFF8D6E63),
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildPhysicalBox(
                  "Tinggi Saat Ini",
                  controller.currentHeight,
                  const Color(0xFF0F3A20),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildPhysicalBox(
                  "Berat Saat Ini",
                  controller.currentWeight,
                  const Color(0xFF8D6E63),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhysicalBox(String label, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  // 5. Tips Perkembangan
  Widget _buildTipsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF7F6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD8ECE9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.lightbulb_outline, color: Color(0xFF147A6A), size: 18),
              SizedBox(width: 6),
              Text(
                "Tips Perkembangan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF147A6A),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Lanjutkan aktivitas bermain peran (roleplay) untuk meningkatkan kemampuan bersosialisasi ${controller.childName} dengan teman sebaya.",
            style: const TextStyle(
              color: Color(0xFF2C5550),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
