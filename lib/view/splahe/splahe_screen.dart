import 'package:exam_test/view/splahe/controlle_splaahe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplaheScreen extends StatelessWidget {
   SplaheScreen({super.key});
   SplashController controller =Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    controller.navigate();
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/splahe.json',
            ),
          ],
        ),
      ) ,

    );
  }
}

