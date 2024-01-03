/*
import 'package:exam_test/view/home_screnn/home_page.dart';
import 'package:exam_test/view/home_screnn/proifile.dart';
import 'package:exam_test/view/home_screnn/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController2 controller = Get.put(HomeController2());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          onTap: (i) => controller.changePage(i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.indigo,
              ),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
              title: const Text(
                "Setting",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
          ],
        ),
      ),
      body: Obx(() {
        switch (controller.currentIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return const Setting();
          case 2:
            return Profile();
          default:
            return Container();
        }
      }),
    );
  }
}
*/
import 'package:exam_test/view/home_screnn/home_page.dart';
import 'package:exam_test/view/home_screnn/proifile.dart';
import 'package:exam_test/view/home_screnn/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController2 controller = Get.put(HomeController2());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          onTap: (i) => controller.changePage(i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.indigo,
              ),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
              title: const Text(
                "Setting",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
              selectedColor: Colors.indigo,
            ),
          ],
        ),
      ),
      body: Obx(() {
        switch (controller.currentIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return const Setting();
          case 2:
            return Profile();
          default:
            return Container();
        }
      }),
    );
  }
}
