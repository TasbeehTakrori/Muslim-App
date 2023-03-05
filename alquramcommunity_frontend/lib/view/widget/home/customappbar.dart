import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/logowidget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedIcon;
  const CustomAppBar({Key? key, this.onPressedIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        const Expanded(flex: 2, child: logoWidget(logowidth: 70, sizeType: 2)),
        Expanded(
            flex: 2,
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child: const Text("12",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    const SizedBox(width: 10),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                        child: Image.asset(AppImageAsset.diamond,
                            width: 28, height: 28))
                  ]),
                  const SizedBox(height: 5),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text("24580", style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 8),
                    Container(
                        margin: EdgeInsets.only(left: 11, right: 12),
                        child: Image.asset(AppImageAsset.coin,
                            width: 20, height: 20))
                  ])
                ])))
      ]),
    );
  }
}
