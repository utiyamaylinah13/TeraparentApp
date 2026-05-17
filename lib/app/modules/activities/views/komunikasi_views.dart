import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:teraparent_mobile/app/modules/activities/controllers/activities_controller.dart';

class KomunikasiView extends GetView<ActivitiesController> {

  const KomunikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Komunikasi View'),
      ),
    );
  }

}