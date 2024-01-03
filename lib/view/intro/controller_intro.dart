import 'package:exam_test/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/cheack_key.dart';
import '../../utils/helper/shrard_prefreans.dart';
class IntroController extends GetxController {
  final PageController nextPage = PageController(initialPage: 0);
  var currentPage = 0.obs;
  void onPageChanged(int index) {
    currentPage.value = index;
  }
  void goToPreviousPage() {
    nextPage.animateToPage(currentPage.value - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
  void goToNextPage() {
    nextPage.animateToPage(currentPage.value + 1,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
  void saveData() async {
    await SharedPreferencesHelper()
        .save(key: CasheKeys.introKey, value: true, type: SaveType.boolType);
  }

  void navigateToLoginScreen() {
    //Fip5Navigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());
    Get.offAll(()=>LoginScreen());
  }

}