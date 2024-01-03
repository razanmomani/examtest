import 'package:exam_test/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home_screnn/home.dart';
import 'view/splahe/splahe_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      /* initialBinding: BindingsBuilder(() {
        Get.lazyPut<SilentLoginController>(() => SilentLoginController());
      }),*/
      home: FirebaseAuth.instance.currentUser == null
          ? SplaheScreen()
          : const Home(),
      /*  getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/Home', page: ()=>const Home()),
      ],
*/
      debugShowCheckedModeBanner: false,
    );
  }
}
