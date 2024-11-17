import 'package:elearning_app/controllers/main_controller.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = MainController.to;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                     left: 0, right: 0,
                    child: Container(
                      decoration: const BoxDecoration(color: primaryColor),
                      height: 150,
                      width: Get.width,
                    ),
                  ),
                  Positioned(top: 80, child: Image.asset(tiLearning)),
                  Positioned(
                      top: 125,
                       left: 0, right: 0,
                      child: SizedBox(
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Courses, Insights, or Events',
                                hintStyle: const TextStyle(
                                    color: formBg, fontSize: 16),
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w100),
                                filled: true,
                                fillColor: tagSmallBg,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIconConstraints:
                                    const BoxConstraints(minWidth: 50),
                                prefixIcon: SvgPicture.asset(
                                  searchSvg,
                                ),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 110),
                itemCount: controller.homeIcon.length,
                itemBuilder: (_, i) => GestureDetector(
                      onTap: () {
                        Get.toNamed(controller.homeRoute[i]);
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: primaryColor),
                            child: SvgPicture.asset(
                              controller.homeIcon[i],
                              width: 25,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                              child: Text(
                            controller.homeStr[i],
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
