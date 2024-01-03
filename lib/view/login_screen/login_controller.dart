import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_test/config/currentsession.dart';
import 'package:exam_test/config/firebase_expation/erorr_firebase.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/utils/ui/loadin_screen.dart';
import 'package:exam_test/view/regester/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home_screnn/home.dart';
class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  GlobalKey formKey = GlobalKey<FormState>();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isPasswordObscure = false.obs;
  void login(String email, String password) async {
    try{
      if (isValid(email, password)) {
        LoadingScreen.shared.startLoading(Get.context);
        UserCredential long = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (long.user != null) {
          UserModel? model = await getDataFromFirestore(long.user!.uid);
         // LoadingScreen.shared.stopeLoading();
          if (model != null) {
            CurrentSession().user = model;
            CommnScreen().showSnackBar('Success', 'Login Success');
            Get.offAll(const Home());
          } else {
            CommnScreen().showSnackBar('Failed', 'Login Failed');
          }
        }
      }}catch(erorr) {
        if (erorr is FirebaseException) {
          CommnScreen()
              .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
           LoadingScreen.shared.stopeLoading();

        } else {
          CommnScreen().showSnackBar('Failed', erorr.toString());
        }
      }
    }

  // Obscure password &confirmPassword
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  //erorr text
  bool isValid(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Email is Required";
      return false;
    } else if (password.isEmpty) {
      passwordError.value = "Password is Required";
      return false;
    }
    return true;
  }

  //login Firestore
  Future<UserModel?> getDataFromFirestore(String uid) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      var result = await collection.where("uid", isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        UserModel model = UserModel.fromMap(result.docs.first.data());
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

 //silentLogin
/*  void silentLogin() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        // User is already signed in, do something here.
      //  Get.snackbar("Silent Login", "User already logged in");
        Get.to(Home());
      } else {
        // Perform silent login
        UserCredential userCredential = await auth.signInAnonymously();
      //  Get.snackbar("Silent Login", "User signed in anonymously");
        Get.to(LoginScreen());
      }
    } catch (e) {
      Get.snackbar("Silent Login Error", e.toString());
    }
  }*/
}



