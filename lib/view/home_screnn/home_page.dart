import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/home_screnn/controlle_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().readDataFromDatabase();
    return Scaffold(
      appBar: CommnScreen().getappBar(title: "Home"),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Types of Tests               ',
              style: GoogleFonts.alikeAngular(
                color: Colors.indigo,
                fontSize: 22,
              ),
            ),
            const SizedBox(height:20,),
            Obx(()=> Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                ),
                child: Padding(
                  padding:  const EdgeInsets.all(4.0),
                  child: Text("Examination :BPM   Result: ${controller.bpm}"),
                ),
              ),),
            Obx(()=> Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
              ),
              child: Padding(
                padding:  const EdgeInsets.all(4.0),
                child: Text("Examination :Gloc   Result: ${controller.gloc}"),
              ),
            ),),
            Obx(()=> Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
              ),
              child: Padding(
                padding:  const EdgeInsets.all(4.0),
                child: Text("Examination :Temp  Result: ${controller.temp}"),
              ),
            ),),
            Obx(()=> Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
              ),
              child: Padding(
                padding:  const EdgeInsets.all(4.0),
                child: Text("Examination:Glocuse  Result: ${controller.glocuse}"),
              ),
            ),),
            Obx(()=> Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
              ),
              child: Padding(
                padding:  const EdgeInsets.all(4.0),
                child: Text("Examination:Insulin  Result: ${controller.insulin}"),
              ),
            ),),

          ],
        ),
      ),
    );
  }
}

/*
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/home_screnn/controlle_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommnScreen().getappBar(title: 'Home'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=> Text("BMP ${controller.bpm.value}")),

            Obx(()=> Text("gloc ${controller.gloc.value}")),

            Obx(()=> Text("temp ${controller.temp.value}")),
            Obx(()=> Text("glocuse ${controller.glocuse.value}")),
            Obx(()=> Text("insulin ${controller.insulin}")),

        ],
      ),
    ),
    );
  }
}




*/

/*
            Obx(() => Text("BMP ${controller.bpm.value}")),
            Obx(() => Text("gloc ${controller.gloc.value}")),
            Obx(() => Text("temp ${controller.temp.value}")),
            Obx(() => Text("glocuse ${controller.glocuse.value}")),
            Obx(() => Text("insulin ${controller.insulin.value}")),
            */
