import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/core/widgets/bottom_nav.dart';
import 'package:teraparent_mobile/app/core/widgets/card_daily_activity.dart';
import 'package:teraparent_mobile/app/core/widgets/header_profile.dart';
import 'package:teraparent_mobile/app/core/theme/colors.dart';
import 'package:teraparent_mobile/app/routes/app_pages.dart';
import '../controllers/activities_controller.dart';

class ActivitiesView extends GetView<ActivitiesController> {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(),

      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              headerProfile(),

              SizedBox(height: 30),
              // TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aktivitas Hari Ini',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff202020),
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          '20 Mei 2025',
                          style: TextStyle(fontSize: 18, color: AppColors.primary, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ================= MOTORIK HALUS =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.gesture, color: Color(0xff2F6F57)),

                      SizedBox(width: 8),

                      Text(
                        'Motorik Halus',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xffBDEAF0),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: const Text(
                      '2 Aktivitas',
                      style: TextStyle(
                        color: Color(0xff2F6F57),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              DailyActivityCardSuccess(
                title: 'Menyusun Balok', 
                time: '09:00 WIB'),

              const SizedBox(height: 18),
              DailyActivityCardNone(
                imageUrl: "https://imgs.search.brave.com/ILj1lhC8OBlKORancEnHQvnbRoJ33JwBVHx3l2DsutQ/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODEw/NjY1NTQyL2lkL2Zv/dG8vcGVuc2lsLWRp/LXRhbmdhbi1hbmFr/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz0tbk4xTGZjUlVE/ODdCSkJsZFNBVjJk/NjRNcEx1R3IwazZl/aTRDZjh2NTU4PQ",
                title: 'Mewarnai Pola',
                description: 'latihan mewarnai untuk melatih koordinasi mata dan tangan',
                time: '16.00',
                onStart: () {
                  Get.toNamed(Routes.DETAIL_ACTIVITY);
                },
              ),
              const SizedBox(height: 32),

              // MOTORIK KASAR
              const Row(
                children: [
                  Icon(Icons.accessibility_new, color: Color(0xff2F6F57)),

                  SizedBox(width: 8),

                  Text(
                    'Motorik Kasar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              const SizedBox(height: 18),
              DailyActivityCardSuccess(
                title: 'Bermain Bola', 
                time: '10:00 WIB'),
              const SizedBox(height: 18),
              
              DailyActivityCardNone(
                imageUrl: "https://imgs.search.brave.com/zmlUaqMWUdPH-nO5dtFq2ikoaboiYpI0xjz7FGmKdY8/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9zdDQu/ZGVwb3NpdHBob3Rv/cy5jb20vNDYwNDMw/NS8yMjkyMS9pLzQ1/MC9kZXBvc2l0cGhv/dG9zXzIyOTIxNDc5/MC1zdG9jay1waG90/by1jaGlsZC1iaWN5/Y2xlLWFzcGhhbHQt/cm9hZC1zdW1tZXIu/anBn",
                title: 'Bersepeda',
                description: 'latihan bersepeda untuk melatih keseimbangan dan koordinasi',
                time: '15.00',
                onStart: () {
                  Get.toNamed(Routes.DETAIL_ACTIVITY);
                },
              ),

              const SizedBox(height: 32),

              // KOMUNIKASI
              const Row(
                children: [
                  Icon(Icons.chat_bubble_outline, color: Color(0xff8B5E1A)),

                  SizedBox(width: 8),

                  Text(
                    'Komunikasi',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              DailyActivityCardNone(
                imageUrl: "https://imgs.search.brave.com/27ClwBV24TdG4OiiB2jmNxt-2k1_yzklGhbx22SJZ_8/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4w/LXByb2R1Y3Rpb24t/aW1hZ2VzLWtseS5h/a2FtYWl6ZWQubmV0/L1JvLXdEVU5jNUVj/VlkxS3dSeUtjcHhT/UDJuZz0vMzIweDIx/Ny9zbWFydC9maWx0/ZXJzOnF1YWxpdHko/NzUpOnN0cmlwX2lj/YygpOmZvcm1hdCh3/ZWJwKS9rbHktbWVk/aWEtcHJvZHVjdGlv/bi9tZWRpYXMvNTU1/OTUxNC9vcmlnaW5h/bC8wMzY0MDU2MDBf/MTc3NjU3OTEzOS1t/b3RoZXItdGVsbGlu/Zy1zdG9yeS10d28t/bGl0dGxlLWRhdWdo/dGVyLWhvbWUtZ2Fy/ZGVuXzFfLmpwZw",
                title: "Mendongeng", 
                description: "latihan mendongeng untuk melatih kemampuan berbicara", 
                time: "14.00", 
                onStart: (){
                  Get.toNamed(Routes.DETAIL_ACTIVITY);  
                }
                ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}