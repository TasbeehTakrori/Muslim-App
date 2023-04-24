import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/prayscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customcardhome.dart';
import '../widget/prayingtimes/completedPray_dialog.dart';
import '../widget/prayingtimes/location_dialog.dart';
import '../widget/prayingtimes/prayingtopCard.dart';
import '../widget/prayingtimes/prayslist.dart';

class PrayScreen extends StatelessWidget {
   PrayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());
    prayController.onInit();
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(AppRoute.home);
        return false;
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: SingleChildScrollView(  // wrap Column widget in SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Obx(() => PrayCardHome(
                  heigh: 180,
                  date: prayController.formativeCurrentDate.value,
                  hijridate: prayController.formativeHijriDate.value,
                  fontSize1: 17,
                  fontSize2: 20,
                  nextPray:prayController.nextPrayer.value.name.toUpperCase(),
                  city_name:prayController.city.value,
                   remainingTime: prayController.formattedRemainingTime.value,
                )),
                  GestureDetector(
                    onTap: () {
                   Get.dialog(PrayerProgressDialog());
                    },
                    child: Card(
                      child: Text("My progress"),
                    ),
                  ),              
                Obx(() {
                  final prayerTimes = prayController.prayerTimesmap.value;
                  if (prayerTimes == null) {
                    return CircularProgressIndicator(); // Show a loading spinner
                  } else {
                  return PrayerTimesListView();

                }})
              ],
            ),
          ),
        ),
      ),
    );
  }
}