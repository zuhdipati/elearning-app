import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning_app/controllers/boarding_controller.dart';
import 'package:elearning_app/widget/boarding_content.dart';
import 'package:elearning_app/widget/dot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = BoardingController();
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller.carouselController,
                      itemCount: controller.titles.length,
                      itemBuilder: (context, index, realIndex) {
                        return OnboardingContent(
                          imagePath: controller.images[index],
                          title: controller.titles[index],
                          description: controller.descriptions[index],
                        );
                      },
                      options: CarouselOptions(
                        height: 580,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value = index;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.titles.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Obx(() => DotWidget(
                                color: controller.currentIndex.value == index
                                    ? Colors.red.shade800
                                    : Colors.grey,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 25,
              child: TextButton(
                onPressed: () async {
                  if (controller.currentIndex.value ==
                      controller.titles.length - 1) {
                    controller.onGetStarted();
                  } else {
                    controller.carouselController
                        .animateToPage(controller.titles.length - 1);
                  }
                },
                child: Obx(() => Text(
                      controller.currentIndex.value ==
                              controller.titles.length - 1
                          ? 'Get Started'
                          : 'Skip',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
