import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_test/config/firebase_expation/erorr_firebase.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/utils/ui/loadin_screen.dart';
import 'package:exam_test/view/login_screen/login_screen.dart';
import 'package:exam_test/view/regester/imgepicer.dart';
import 'package:exam_test/view/regester/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class RegesterController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxString selectedGender = 'Male'.obs;
  final GlobalKey form = GlobalKey<FormState>();
  RxBool isPasswordObscure = true.obs;
  File? profileImage;
  TextEditingController emailControlle = TextEditingController();
  TextEditingController mobilNumberControlle = TextEditingController();
  TextEditingController passwordControlle = TextEditingController();
  TextEditingController confirmPasswordControlle = TextEditingController();
  TextEditingController fullNameControlle = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode mobilNumberFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  FocusNode fullNameFocus = FocusNode();
  RxString erorrEmail = ''.obs;
  RxString erorrPassword = ''.obs;
  Future<void> createRegistrationWithSingUp(UserModel userModel) async {
    if (isValed(userModel.email, userModel.password ?? '')) {
      try {
        LoadingScreen.shared.startLoading(Get.context);
        var result = await auth.createUserWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password!,
        );
        if (result.user != null) {
          userModel.uid = result.user!.uid;
          userModel.imgUrl = await saveImageStorge(userModel.file!);
          getRegisterFirestoreLogin(userModel);
          // Get.to(LoginScreen());
        } else {
          LoadingScreen.shared.stopeLoading();
          CommnScreen().showSnackBar('Failed', 'Failed UnRegester');
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (erorr) {
        LoadingScreen.shared.stopeLoading();
        if (erorr is FirebaseException) {
          CommnScreen()
              .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
        } else {
          CommnScreen().showSnackBar('Failed', 'Regester UnSuccess $erorr');
        }
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
  }

  bool isValed(String email, String password) {
    erorrEmail.value = '';
    erorrPassword.value = '';
    if (email.isEmpty) {
      erorrEmail.value = 'Email is Required';
      return false;
    } else if (password.isEmpty) {
      erorrPassword.value = ' password is Required ';
      return false;
    } else if (password.length < 6) {
      erorrPassword.value = 'please enter Strong password';
      return false;
    }
    return true;
  }

//gender save in firebase
  void setGender(String gender) {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('users').set({'gender': gender});
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  // Obscure password &confirmPassword
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  //firebase regester firestore
  void getRegisterFirestoreLogin(UserModel userModel) async {
    try {
      final firestore = FirebaseFirestore.instance;
      var docId = firestore.collection('users').doc();
      String userId = docId.id;
      var collection = FirebaseFirestore.instance.collection('users');
      await collection.add(userModel.toMap());

      // shared

      LoadingScreen.shared.stopeLoading();
      CommnScreen().showSnackBar('Success', 'Register Success');
      //Get.offAllNamed('/login');
      // Get.off('/login');
      Get.to(LoginScreen());
    } catch (error) {
      if (error is FirebaseException) {
        Get.snackbar('Failed', FirebaseErrors.getMessage(error.code));
      }
    }
  }

//image picker
  void profileImagePicking(bool fromCamera) async {
    ImagePickerBase imagePicker = YourImagePicker();
    File? image;
    if (fromCamera) {
      image = await imagePicker.pickImageFromCamera();
    } else {
      image = await imagePicker.pickImageFromGallery();
    }
    if (image != null) {
      profileImage = image;
      Get.back();
      update();
    }
  }

  //storge image in firebase
  Future<String> saveImageStorge(File imgFile) async {
    try {
      Reference storgeReference = FirebaseStorage.instance.ref();
      String fileName =
          "fox5${DateTime.now().microsecondsSinceEpoch}${(Random().nextInt(1000))}";
      Reference imageRef=storgeReference.child("image/$fileName.jpg");
      await imageRef.putFile(imgFile);
      return imageRef.getDownloadURL();
    } catch (erorr){
      if(erorr is FirebaseException){
        CommnScreen().showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
      }
      return "";
    }
  }
}
