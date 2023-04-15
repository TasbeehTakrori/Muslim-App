import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/recitationscreen_controller.dart';
import 'listsurahcardrecitation.dart';

class SurahsDialogRecitation extends StatelessWidget {
  const SurahsDialogRecitation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecitationScreenController());

    return GetBuilder<RecitationScreenController>(
      builder: (controller) {
        // final lastOpenedEng = controller.getLastOpenedEng();
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: SizedBox(
              width: 600,
              height: 550,
              child: ListView(
                children: const [
                  Text("Surahs of the Qur'an",
                      style: TextStyle(fontFamily: "Cairo")),
                  SizedBox(height: 6),
                  ListSurahCardRecitation(),
                ],
              ),
            ));
      },
    );
  }
}
