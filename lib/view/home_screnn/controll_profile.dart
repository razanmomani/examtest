import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_test/config/currentsession.dart';
import 'package:exam_test/view/home_screnn/model_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController mobileController = TextEditingController();
  GlobalKey formKey =GlobalKey<FormState>();
  String imgUrl = '';
  final userId = FirebaseAuth.instance.currentUser?.uid;
  Future<void> editData(String docId) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      var result =
      await collection.where("uid", isEqualTo:CurrentSession().user!.uid).get();
      if (result != null && result.docs.isNotEmpty) {
        //for (var item in result.docs) {
        //  ConfigModel model = ConfigModel.fromMap(item.data());
        ConfigModel model = ConfigModel.fromMap(result.docs.first.data());

        String docId  = result.docs.first.id;
        model.email = emailController.text;
        model.fullName = fullNameController.text;
        model.mobile = mobileController.text;
        model.gender = genderController.text;
          collection.doc(docId).update(model.toMap());
        }
      //}
      } catch (e) {
      print('Error editing data: $e');
    }
  }
}