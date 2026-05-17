import 'package:get/get.dart';

class GrafikPerkembanganController extends GetxController {
  final String childName = "Arka";
  final String childAge = "2 Tahun 4 Bulan";
  final String currentHeight = "88.5 cm";
  final String currentWeight = "12.4 kg";

  // Data Nilai Radar (Skala 0 sampai 5)
  // Urutan aspek: Komunikasi, Sosial, Motorik Kasar, Motorik Halus, (Tambahan aspek ke-5 agar jadi segi lima)
  final List<double> radarValues = [4.5, 4.8, 4.0, 4.7, 3.8]; 
  final List<String> radarFeatures = ["Komunikasi", "Sosial", "Motorik\nKasar", "Motorik\nHalus", "Kognitif"];

  // Data Milestones
  final List<Map<String, String>> milestones = [
    {"title": "Bisa menumpuk 3 balok", "date": "Tercapai: 12 Okt 2023"},
    {"title": "Mengucapkan 2 kata sekaligus", "date": "Tercapai: 05 Okt 2023"},
    {"title": "Mulai meniru teman sebaya", "date": "Tercapai: 28 Sep 2023"},
  ];
}
