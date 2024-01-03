import 'package:exam_test/config/app_constant/app_size.dart';
import 'package:exam_test/utils/ui/commnscreen.dart';
import 'package:exam_test/view/home_screnn/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommnScreen().getappBar(title: 'Setting'),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: link.length,
            itemBuilder: (context, index) {
              final SettengModel model = link[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(5),
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        model.title,
                        style: GoogleFonts.alike(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.spasing1,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        model.icon.icon,
                        color: Colors.indigo,
                      ),
                    ),
                    const Spacer(),
                    const InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
