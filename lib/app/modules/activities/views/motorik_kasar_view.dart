import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/modules/activities/controllers/activities_controller.dart';

class MotorikKasarView extends GetView<ActivitiesController> {
  const MotorikKasarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motorik Kasar'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Halaman Motorik Kasar'),
      ),
    );
  }
}