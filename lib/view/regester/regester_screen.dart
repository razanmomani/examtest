import 'dart:io';
import 'package:exam_test/config/app_constant/app_size.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/regester/controller.dart';
import 'package:exam_test/view/regester/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/gender_controlle.dart';
class RegesterScreen extends StatelessWidget {
  RegesterScreen({super.key});
 final RegesterController controller = Get.put(RegesterController());
  final GenderController genderController = Get.put(GenderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommnScreen().getappBar(title: 'Sing Up'),
      body: Form(
        key: controller.form,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //image picker
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.photo_camera),
                                title: const Text('Camera'),
                                onTap: () {
                                 controller.profileImagePicking(true);
                           //      Get.back();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text('Gallery'),
                                onTap: () {
                                  controller.profileImagePicking(false);
                              //    Get.back();

                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                    child:GetBuilder<RegesterController>(
                      init: RegesterController(),
                      builder: (regesterController){
                        return CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          child: controller.profileImage == null
                              ? Lottie.asset('assets/images/animation_cam.json')
                              :ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  File(controller.profileImage!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),


                        );
                      }
                    ),
                  ),
                const SizedBox(height: AppSize.spasing1,),
                Obx(()=>CommnScreen().createTextFormFiled(
                      controller: controller.emailControlle,
                      focusNode: controller.emailFocus,
                      label: 'Email',
                      InputActione: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      errorText: controller.erorrEmail.isEmpty?null:
                      controller.erorrEmail.value,
                      onSubmitted: (v) {
                        controller.fullNameFocus.requestFocus();
                      }),
                ),
                const SizedBox(height: AppSize.spasing1,),
                Obx(()=>CommnScreen().createTextFormFiled(
                    controller: controller.fullNameControlle,
                    focusNode: controller.fullNameFocus,
                    label: 'Full Name',
                    errorText: controller.erorrPassword.isEmpty?null:
                    controller.erorrPassword.value,
                    InputActione: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onSubmitted: (v) {
                      controller.passwordFocus.requestFocus();
                    },
                  ),
                ),
                const SizedBox(height: AppSize.spasing1,),
                Obx(()=>CommnScreen().createTextFormFiled(
                      controller: controller.passwordControlle,
                      focusNode: controller.passwordFocus,
                      label: 'Password',
                      isObscuer: controller.isPasswordObscure.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.togglePasswordVisibility();
                        },
                        child: Icon(
                          controller.isPasswordObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.indigo,
                        ),
                      ),
                      InputActione: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSubmitted: (v) {
                        controller.confirmPasswordFocus.requestFocus();
                      }),
                ),
                const SizedBox(height: AppSize.spasing1,),
                Obx(()=> CommnScreen().createTextFormFiled(
                    controller: controller.confirmPasswordControlle,
                    focusNode: controller.confirmPasswordFocus,
                    isObscuer: controller.isPasswordObscure.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Icon(
                        controller.isPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.indigo,
                      ),
                    ),
                    label: 'Confirm Password',
                    InputActione: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onSubmitted: (v) {
                      controller.mobilNumberFocus.requestFocus();
                    },
                  ),
                ),
                const SizedBox(height: AppSize.spasing1,),
                CommnScreen().createTextFormFiled(
                    controller: controller.mobilNumberControlle,
                    focusNode: controller.mobilNumberFocus,
                    label: 'Mobil Number',
                    InputActione: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    preffixText: '+ 962 ',
                  ),

                const SizedBox(height: AppSize.spasing1,),
                //gender
          Container(
            width: 340,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.indigo,
                width: 1,
              ),
              color: Colors.white,
            ),
            child: Obx(() => Row(
              children: [
                const SizedBox(width: 5),
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ), const SizedBox(width: 10), // Male Radio Button
                Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                      //  genderController.selectedGender.value = value!;
                        genderController.selectedGender(value!);
                        controller.setGender('Male');
                        print(genderController.selectedGender.value);
                      },
                    ),
                    const Text('Male'),
                  ],
                ), // Female Radio Button
                Row(
                  children: [
                    Radio<String>(
                      value: "Female",
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        genderController.selectedGender(value!);
                        controller.setGender('Female');
                        print(genderController.selectedGender.value);
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
              ],
            )),
          ),
                const SizedBox(height: AppSize.spasing2,),

                CommnScreen().createButton(
                    title: 'Regester',
                    onPressed: () async{
                      File file=File(controller.profileImage!.path);
                      UserModel model=UserModel(
                          email: controller.emailControlle.text,
                          mobile:controller.mobilNumberControlle.text ,
                          fullName: controller.fullNameControlle.text,
                          password: controller.passwordControlle.text,
                          confirmPassword: controller.confirmPasswordControlle.text,
                          gender:'',
                          imgUrl: '',
                      );
                      model.file=file;
                      controller.createRegistrationWithSingUp(model);
                    //  Get.to(() => LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
