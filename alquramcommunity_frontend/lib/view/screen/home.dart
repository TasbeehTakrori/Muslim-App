import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget/home/categoriesHome.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/listcommunities.dart';
import '../widget/home/statisticscard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(onPressedIcon: () {}),
            CustomCardHome(title: "2".tr, body: "{واستعينوا بالصّبر والصّلاة}"),
            const ListCategoriesHome(),
            const SizedBox(height: 10),
            const Text("مُجتمعات القُرآن"),
            const ListCommunities(),
            const StatisticsCard(),
          ],
        ));
  }
}