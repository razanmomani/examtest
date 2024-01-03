import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_test/config/firebase_expation/erorr_firebase.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen {
  static LoadingScreen shared = LoadingScreen();
  BuildContext? context;
  Widget createWithLoadingScreen({Color? color, double size = 50}) {
    return Stack(
      children: [
        getCiricleIndecater(color: color, size: size),
      ],
    );
  }
  Widget getCiricleIndecater({Color? color, double size = 50}) {
    return Center(
      child: SpinKitFadingCircle(
        color: color ?? Colors.blue,
        size: 50,
      ),
    );
  }

  void startLoading(BuildContext? context) {
    if (context == null) {
      return;
    }
    LoadingScreen.shared.context = context;
    showDialog(
        context: context,
        builder: (context) {
          return createWithLoadingScreen();
        },
        barrierDismissible: false);
  }

  void stopeLoading() {
    try {
      if (LoadingScreen.shared.context != null &&
          Navigator.of(LoadingScreen.shared.context!).canPop()) {
        Navigator.of(LoadingScreen.shared.context!, rootNavigator: true).pop();
        LoadingScreen.shared.context = null;
      }
    } catch (erorr) {
      if (erorr is FirebaseException) {
        CommnScreen()
            .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
      }
    }
  }
}
