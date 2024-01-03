import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommnScreen{
  //singloaten
  static final CommnScreen sheard=CommnScreen.priveat();
  factory CommnScreen()=>sheard;
  CommnScreen.priveat();

  //appBar
  AppBar getappBar({required String title}){
    return AppBar(
      backgroundColor: Colors.indigo,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      leading: const Icon(Icons.arrow_back,
      color: Colors.white,
      ),
      title: Text(title,
        style: GoogleFonts.akatab(
          fontSize: 25,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),

      ),
      centerTitle: true,

    );

  }

//create button
  Widget createButton({required String title,required VoidCallback onPressed}){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),)
        ),
        onPressed: onPressed,
        child: Text(title,
          style: GoogleFonts.alikeAngular(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),

        )
    );
  }
//cteate TextFormFiled

  Widget createTextFormFiled({
    required TextEditingController controller, required FocusNode focusNode,
        required String label,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction InputActione = TextInputAction.done,
        bool isObscuer =false,
        ValueChanged<String>?onSubmitted,
        String ?preffixText,
        Widget ?suffixIcon,
        String ?errorText,
      }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscuer!,
      keyboardType: keyboardType,
      textInputAction: InputActione,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.indigo,
        ),
        prefixText: preffixText,
        suffixIcon: suffixIcon,
        errorText: errorText,
        border: _getBorder(),
        enabledBorder: _getBorder(),
        disabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
    );
  }
  // widget border in text form filed
  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.indigo,
      ),
    );
  }


// SnackBar masseges

  void showSnackBar(String title,String msg){
    Get.snackbar(
      title, msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.indigo,
      colorText: Colors.white,
      duration:const Duration(seconds: 5),
    );
  }









}