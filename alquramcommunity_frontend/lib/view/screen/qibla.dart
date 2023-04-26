import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/qiblascreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';


class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final QiblaScreenControllerImp qiblaController = Get.put(QiblaScreenControllerImp());
    qiblaController. getCurrentLocation();

    return LayoutBuilder(
      builder:(context,constraints){
      final height=constraints.maxHeight;
      final width=constraints.maxWidth;

      return WillPopScope(
        onWillPop: () async {
          Get.toNamed(AppRoute.home);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: Column(
            children: [
              const SizedBox(height:30),
              const Center(
                child: Text("Qibla Compass",
                style: TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              const SizedBox(height:30),
              SizedBox(
              height: width,width:width,
              child:Center(
                child: Stack(
                  
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/images/compass.svg",height: width,width:width),
                    Obx(()=>Transform.rotate(
                      angle: qiblaController.qiblaDirection.value* pi,
                      child:   SvgPicture.asset("assets/images/needle.svg",height: width,width:width),

                    )
                    )
                    
                    
              
                  ],
                ),
              ),
               
              
              ),
             
              
            ],
          ),
              ),
            );
      }
    );
        
      
    
  }
}
