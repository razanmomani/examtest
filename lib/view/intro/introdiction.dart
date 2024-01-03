import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/intro/controller_intro.dart';
import 'package:exam_test/view/intro/introdiction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class IntroductionPage extends StatelessWidget {IntroductionPage({super.key});
final  IntroController controller = Get.put(IntroController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
        controller: controller.nextPage,
        onPageChanged: controller.onPageChanged,
        itemCount: item.length,
        itemBuilder: (context, index) {
          final BoardingModel model = item[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                model.image,
              ),
              Column(
                children: [
                  Text(
                    model.title,
                    style: GoogleFonts.alike(
                      color: Colors.blueAccent,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    model.subTitle,
                    style: GoogleFonts.alike(
                      color: Colors.black,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 110,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SmoothPageIndicator(
                        controller: controller.nextPage,
                        count: item.length,
                        effect:  const WormEffect(),
                        onDotClicked: (index) {},
                      ),
                      const SizedBox(height: 20,),],),],),
              Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommnScreen().createButton(
                        title: 'Back',
                        onPressed: controller.goToPreviousPage,
                      ),
                    ),
                    controller.currentPage.value == item.length -1
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommnScreen().createButton(
                              title: 'Done',
                              onPressed: () {
                                controller.saveData();
                                controller.navigateToLoginScreen();
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommnScreen().createButton(
                              title: 'Next',
                              onPressed: controller.goToNextPage,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
