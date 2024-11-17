import 'package:elearning_app/controllers/main_controller.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = MainController.to;

    return Scaffold(
        body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: controller.navigationPages),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.grey),
            ),
          ),
          child: Obx(() => NavigationBar(
                  selectedIndex: controller.tabIndex.value,
                  onDestinationSelected: (value) {
                    controller.tabIndex.value = value;
                    controller.pageController.jumpToPage(value);
                  },
                  destinations: [
                    NavigationDestination(
                        selectedIcon: SvgPicture.asset(navHome,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                        icon: SvgPicture.asset(navHome,
                            colorFilter: const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                        label: 'Home'),
                    NavigationDestination(
                        selectedIcon: SvgPicture.asset(navCourse,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                        icon: SvgPicture.asset(navCourse,
                            colorFilter: const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                        label: 'Courses'),
                    NavigationDestination(
                        selectedIcon: SvgPicture.asset(navProfile,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                        icon: SvgPicture.asset(navProfile,
                            colorFilter: const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                        label: 'Profile'),
                  ])),
        ));
  }
}
