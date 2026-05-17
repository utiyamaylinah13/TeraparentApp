import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatController extends GetxController {
  // Data Ringkasan Statistik
  final int therapySessionsCount = 12;
  final int homeActivitiesCount = 24;
  final int screeningsCount = 5;

  // Data Riwayat Terkelompok
  final List<Map<String, dynamic>> todayActivities = [
    {
      "title": "Terapi Okupasi",
      "child": "Arka Wijaya",
      "time": "09:30",
      "status": "Selesai",
      "statusType": "success",
      "icon": Icons.medical_services_outlined,
      "iconBg": const Color(0xFFE0F2F1),
      "iconColor": const Color(0xFF00796B),
    },
    {
      "title": "Latihan Motorik Halus",
      "child": "Arka Wijaya",
      "time": "07:00",
      "status": "Tugas Mandiri",
      "statusType": "info",
      "icon": Icons.home_outlined,
      "iconBg": const Color(0xFFE1F5FE),
      "iconColor": const Color(0xFF0288D1),
    }
  ];

  final List<Map<String, dynamic>> yesterdayActivities = [
    {
      "title": "Skrining M-CHAT-R",
      "child": "Arka Wijaya",
      "time": "14:20",
      "status": "Laporan Tersedia",
      "statusType": "warning",
      "icon": Icons.analytics_outlined,
      "iconBg": const Color(0xFFFFF3E0),
      "iconColor": const Color(0xFFF57C00),
    },
    {
      "title": "Terapi Wicara",
      "child": "Arka Wijaya",
      "time": "11:00",
      "status": "Selesai",
      "statusType": "success",
      "icon": Icons.hearing_outlined,
      "iconBg": const Color(0xFFE8F5E9),
      "iconColor": const Color(0xFF388E3C),
    }
  ];

  final List<Map<String, dynamic>> lastWeekActivities = [
    {
      "title": "Mewarnai Pola",
      "child": "Arka Wijaya",
      "time": "12 Mei",
      "status": "Divalidasi Terapis",
      "statusType": "success",
      "icon": Icons.border_color_outlined,
      "iconBg": const Color(0xFFE0F7FA),
      "iconColor": const Color(0xFF0097A7),
    }
  ];
}