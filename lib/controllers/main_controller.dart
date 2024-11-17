import 'package:elearning_app/pages/home_page.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  RxInt tabIndex = 0.obs;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final List<Widget> navigationPages = [
    const HomePage(),
    const Center(child: Text("Course Page")),
    const Center(child: Text("Profile Page")),
  ];

  final List<String> homeIcon = [coursesSvg, audioSvg];
  final List<String> homeStr = ['Courses', 'Audio Book'];
  final List<String> homeRoute = [Routes.course, Routes.audio];

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }

  Future<bool> get hasLogin async {
    final token = await Utils.getToken();
    return token != null;
  }
}
