/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SilentLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _silentLogin();
  }
  Future<void> _silentLogin() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        Get.offAllNamed('/Home');
      } else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      print("Silent login error: $e");
    }
  }
}
*/
