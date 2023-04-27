import 'package:flutter/Material.dart';

import 'listsurahcarttrainer.dart';

class SurahsContentDialog extends StatelessWidget {
  const SurahsContentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Color.fromARGB(255, 235, 244, 54),
        //height: 600,
        height: MediaQuery.of(context).size.height / 1.7,
        child: SizedBox(
          width: 600,
          child: ListView(
            children: const [
              Text("Surahs of the Qur'an",
                  style: TextStyle(fontFamily: "Cairo")),
              SizedBox(height: 6),
              ListSurahCardTrainer(),
            ],
          ),
        ));
  }
}