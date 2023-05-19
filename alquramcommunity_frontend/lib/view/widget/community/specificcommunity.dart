import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controller/commnity_controller.dart';
import '../../../core/constant/routes.dart';
import '../Quran/editquranthemedialog.dart';
import 'chat.dart';
import 'customcommunitycard.dart';
import 'editcommunityplan.dart';
import 'memberRequestDialog.dart';
import 'userscommunity.dart';

class SpecificCommunity extends StatelessWidget {
  final int communityID;
  final String communityName;
  final String communityDateCreate;
  final bool isAdmin;
  const SpecificCommunity(
      {super.key,
      required this.communityID,
      required this.communityName,
      required this.communityDateCreate,
      required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.put(CommunitityController());
    return Dialog.fullscreen(
      child: GetBuilder<CommunitityController>(builder: (controller) {
        return WillPopScope(
            onWillPop: () async {
              controller.getAllCommunities();
              Get.offAllNamed(AppRoute.home);
              return false;
            },
            child: Scaffold(
                floatingActionButton: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isAdmin == true
                        ? FloatingActionButton(
                            heroTag: "setting",
                            backgroundColor: AppColor.thickYellow,
                            child: const Icon(Icons.settings),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext b) {
                                    return EditCommunityPlan();
                                  });
                            })
                        : SizedBox(),
                    const SizedBox(height: 5),
                    FloatingActionButton(
                        heroTag: "chat",
                        backgroundColor: AppColor.primaryColor,
                        child: const Icon(Icons.chat),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext b) {
                                return ChatDialog();
                              });
                        }),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                backgroundColor: AppColor.grey,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        communityName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.patrickHand(
                            //fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                            fontSize: 30),
                      ),
                      Text(
                        "Since $communityDateCreate",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.patrickHand(
                            //fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                            fontSize: 15),
                      ),
                      CustomCommunityCard(
                          communityID: communityID,
                          title: 'Remining Time',
                          fontSize1: 15,
                          fontSize2: 40,
                          heigh: 200,
                          body: '12:45:30',
                          isAdmin: isAdmin),
                      SizedBox(height: 5),
                      UsersCommunity(communityID: communityID),
                      const SizedBox(height: 15),
                      Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: AppColor.light2Yellow,
                        ),
                      )
                    ],
                  ),
                )));
      }),
    );
  }
}
