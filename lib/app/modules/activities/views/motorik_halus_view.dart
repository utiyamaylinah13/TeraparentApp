import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/modules/activities/controllers/activities_controller.dart';

class MotorikHalusView extends GetView<ActivitiesController> {

  const MotorikHalusView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motorik Halus'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Halaman Motorik Halus'),
      ),
    );
  }
}