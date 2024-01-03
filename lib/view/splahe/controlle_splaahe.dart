import 'dart:async';
import 'package:exam_test/config/cheack_key.dart';
import 'package:exam_test/utils/helper/shrard_prefreans.dart';
import 'package:exam_test/view/intro/introdiction.dart';
import 'package:exam_test/view/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void navigate() {
    Timer(const Duration(seconds: 8), () async {
      bool? isIntroEnteredBefore = await SharedPreferencesHelper()
          .read(key: CasheKeys.introKey, type: SaveType.boolType) as bool?;
      Get.offAll(() => isIntroEnteredBefore != null && isIntroEnteredBefore == true
          ? LoginScreen()
          : IntroductionPage()); // Corrected class name
    });
  }
}
