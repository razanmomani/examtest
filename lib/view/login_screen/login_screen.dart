import 'package:exam_test/config/app_constant/app_size.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/login_screen/login_controller.dart';
import 'package:exam_test/view/regester/regester_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controllerLogin = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommnScreen().getappBar(title: 'Login'),
      body: Padding(
        padding:  const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Sing In',
                    style: GoogleFonts.alikeAngular(
                      color: Colors.indigo,
                      fontStyle: FontStyle.italic,
                      fontSize: AppSize.spasing3,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.spasing3,
              ),
              Obx(()=>CommnScreen().createTextFormFiled(
                  controller: controllerLogin.emailController,
                  focusNode: controllerLogin.emailFocus,
                  InputActione: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  errorText: controllerLogin.emailError.isEmpty
                      ? null
                      : controllerLogin.emailError.value,
                  onSubmitted: (v) {
                    controllerLogin.passwordFocus.requestFocus();
                  },
                  label: 'Email',
                ),
              ),
              const SizedBox(
                height: AppSize.spasing2,
              ),
              Obx(()=>CommnScreen().createTextFormFiled(
                  controller: controllerLogin.passwordController,
                  focusNode: controllerLogin.passwordFocus,
                  label: 'Password',
                  InputActione: TextInputAction.done,
                  keyboardType: TextInputType.text,
                isObscuer: controllerLogin.isPasswordObscure.value,
                errorText: controllerLogin.passwordError.isEmpty
                      ? null
                      : controllerLogin.passwordError.value,

                  suffixIcon: InkWell(
                    onTap: () {
                      controllerLogin.togglePasswordVisibility();
                    },
                    child: Icon(
                      controllerLogin.isPasswordObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.spasing4),
              CommnScreen().createButton(
                  title: 'Login',
                  onPressed: (){
                    controllerLogin.login(
                      controllerLogin.emailController.text,
                      controllerLogin.passwordController.text,
                    );
                  //  Get.to(()=>Home());

                  }),
              const SizedBox(
                height: AppSize.spasing1,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Don\'t have an account ?',
                    style: GoogleFonts.alikeAngular(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegesterScreen());
                    },
                    child: Text(
                      'Regester',
                      style: GoogleFonts.alikeAngular(
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
