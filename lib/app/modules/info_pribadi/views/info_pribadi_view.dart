import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/info_pribadi_controller.dart';

class InfoPribadiView extends GetView<InfoPribadiController> {
  const InfoPribadiView({super.key});
@override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF2B5B4B); // Warna hijau tombol & teks utama
    const Color inputBgColor = Color(0xFFF4F6F6);  // Warna abu-abu background input

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            
            // --- FOTO PROFIL DENGAN CIRClE & TOMBOL EDIT ---
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4), // Border lingkaran luar hijau tipis
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFB2DFDB), width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Icon(Icons.person, size: 50, color: Colors.grey), 
                      // Ganti dengan NetworkImage/AssetImage nanti:
                      // backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- TEKS HEADER PROFILE ---
            const Center(
              child: Text(
                "Informasi Pribadi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2D27),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  "Perbarui detail kontak Anda di sini",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- FORM INPUT FIELDS ---
            _buildInputField(
              label: "Nama Lengkap",
              icon: Icons.person_outline,
              controller: controller.nameController,
              backgroundColor: inputBgColor,
            ),
            const SizedBox(height: 18),

            _buildInputField(
              label: "Email",
              icon: Icons.mail_outline,
              controller: controller.emailController,
              backgroundColor: inputBgColor,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 18),

            _buildInputField(
              label: "Nomor Telepon",
              icon: Icons.phone_outlined,
              controller: controller.phoneController,
              backgroundColor: inputBgColor,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 18),

            _buildInputField(
              label: "Lokasi",
              icon: Icons.location_on_outlined,
              controller: controller.locationController,
              backgroundColor: inputBgColor,
            ),
            const SizedBox(height: 40),

            // --- TOMBOL SIMPAN PERUBAHAN ---
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.saveChanges,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded pill style
                  ),
                  elevation: 0,
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Simpan Perubahan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk membuat TextInput yang rapi sesuai mockup
  Widget _buildInputField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required Color backgroundColor,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E35),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF1C2D27),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey.shade600, size: 22),
            filled: true,
            fillColor: backgroundColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // Menghilangkan border garis luar
            ),
          ),
        ),
      ],
    );
  }
}
