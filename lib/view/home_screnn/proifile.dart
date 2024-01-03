import 'package:exam_test/config/currentsession.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/home_screnn/controll_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Profile extends StatelessWidget {
 final ProfileController controller = Get.put(ProfileController());
  Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommnScreen().getappBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(CurrentSession().user!.imgUrl),
                  radius: 50,
                ),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email   ${CurrentSession().user!.email}',
                  ),
                ),
                TextField(
                  controller: controller.fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name   ${CurrentSession().user!.fullName}',
                  ),
                ),
                TextField(
                  controller: controller.mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile ${CurrentSession().user!.mobile}',
                  ),
                ),
                TextField(
                  controller: controller.genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender   ${CurrentSession().user!.gender}',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.editData(controller.userId.toString());

                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
