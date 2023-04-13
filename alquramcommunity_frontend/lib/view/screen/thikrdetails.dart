import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/thikrCatgController.dart';
import '../../core/constant/color.dart';
import '../../data/model/front_models/thikrmodel.dart';
import '../widget/thikr/ThikrDataCard.dart';
import '../widget/thikr/ThikrCardBottom.dart';

class ThikrDetails extends GetView<ThikrCatgControllerImp> {
  const ThikrDetails({super.key});
  @override
  Widget build(BuildContext context) {
    ThikrCatgControllerImp thikrCatgController =
        Get.put(ThikrCatgControllerImp());
    thikrCatgController.onInit();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200, // تعيين الارتفاع المرغوب

          title: const Text("  Muslim Remembrance"),
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            null,
            0,
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: thikrCatgController.loadJSON(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    var section = snapshot.data;
                    thikrCatgController.my();
                    final data = List<Thikr>.from(
                        section["Thikr"].map((x) => Thikr.fromJson(x)));
                    return ListView.builder(
                        itemCount: section.length == 0 ? 0 : section.length,
                        itemBuilder: (context, index) {
                          if (data != null) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: 600,
                              child: ListView.builder(
                                  itemCount:
                                      data[thikrCatgController.selectedThikr]
                                          .tEXT!
                                          .length,
                                  itemBuilder: (BuildContext context, i) {
                                    thikrCatgController.countersList[index][i] =
                                        data[thikrCatgController.selectedThikr]
                                            .tEXT![i]
                                            .rEPEAT!
                                            .obs;
                                    return ThikrDataCardArabic(
                                      arabicText: data[
                                              thikrCatgController.selectedThikr]
                                          .tEXT![i]
                                          .aRABICTEXT
                                          .toString(),
                                      Catg: index,
                                      subCatg: i,
                                    );
                                  }),
                            );
                          }
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
