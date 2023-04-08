import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static.dart';
import '../../screen/surahsdialog.dart';

class ListCategoriesHome extends StatelessWidget {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: CategoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CategoryList[index].onPressedWidget!;
                    ;
                  },
                );
              },
              // CategoryList[index].onPressed,
              child: Container(
                  decoration: BoxDecoration(
                      color:
                          index < 2 ? AppColor.lightPibk : AppColor.lightYellow,
                      borderRadius: BorderRadius.circular(15)),
                  width: 65,
                  height: 65,
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("${CategoryList[index].image}")),
            ),
            const SizedBox(height: 4),
            Text("${CategoryList[index].title}",
                style: TextStyle(
                    fontSize: index < 2 ? 9.5 : 11.5,
                    fontWeight:
                        index < 2 ? FontWeight.bold : FontWeight.normal))
          ]);
        },
      ),
    );
  }
}
