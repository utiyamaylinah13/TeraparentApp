import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/routes/app_pages.dart';

class InfoPribadiController extends GetxController {
// TextEditingControllers untuk Form Input
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;

  var isLoading = false.obs; // Observable untuk loading state

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: "Asep Subagja");
    emailController = TextEditingController(text: "asep.subagja@email.com");
    phoneController = TextEditingController(text: "+62 812-3456-7890");
    locationController = TextEditingController(text: "Kota Tegal, Indonesia");
  }

  void saveChanges() async{
    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 2)
      );

    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String location = locationController.text;

    // Contoh log output (ganti dengan API call sebenarnya)
    print("Menyimpan perubahan:");
    print("Nama: $name");
    print("Email: $email");
    print("Telepon: $phone");
    print("Lokasi: $location");

    // Tampilkan snackbar sebagai feedback
    Get.snackbar(
      "Sukses",
      "Perubahan informasi pribadi berhasil disimpan.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed(Routes.PROFIL);
  }

  @override
  void onClose() {
    // Jangan lupa dispose agar tidak memory leak
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.onClose();
  }
}