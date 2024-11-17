import 'package:elearning_app/controllers/audio_controller.dart';
import 'package:elearning_app/controllers/audio_detail_controller.dart';
import 'package:elearning_app/controllers/auth_controller.dart';
import 'package:elearning_app/controllers/boarding_controller.dart';
import 'package:elearning_app/controllers/course_controller.dart';
import 'package:elearning_app/controllers/course_detail_controller.dart';
import 'package:elearning_app/controllers/main_controller.dart';
import 'package:elearning_app/controllers/splash_controller.dart';
import 'package:elearning_app/index.dart';
import 'package:elearning_app/pages/audio_detail_page.dart';
import 'package:elearning_app/pages/audio_page.dart';
import 'package:elearning_app/pages/boarding_page.dart';
import 'package:elearning_app/pages/course_detail_page.dart';
import 'package:elearning_app/pages/course_page.dart';
import 'package:elearning_app/pages/home_page.dart';
import 'package:elearning_app/pages/login_page.dart';
import 'package:elearning_app/pages/splash.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final initial = Routes.splash;
  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => const SplashPage(),
      binding: BindingsBuilder(
        () => Get.put<SplashController>(SplashController()),
      ),
    ),
    GetPage(
      name: Paths.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () => Get.put<AuthController>(AuthController()),
      ),
    ),
    GetPage(
      name: Paths.boarding,
      page: () => const BoardingPage(),
      binding: BindingsBuilder(
        () => Get.put<BoardingController>(BoardingController()),
      ),
    ),
    GetPage(
        name: Paths.main,
        page: () => const MainNavigation(),
        binding: BindingsBuilder(
          () => Get.put<MainController>(MainController()),
        ),
        children: [
          GetPage(name: Paths.home, page: () => const HomePage(), children: [
            GetPage(
                name: Paths.course,
                page: () => const CoursePage(),
                binding: BindingsBuilder(
                  () => Get.put<CourseController>(CourseController()),
                ),
                children: [
                  GetPage(
                    name: Paths.courseDetail,
                    page: () => const CourseDetailPage(),
                    binding: BindingsBuilder(
                      () => Get.put<CourseDetailController>(
                          CourseDetailController()),
                    ),
                  )
                ]),
            GetPage(
                name: Paths.audio,
                page: () => const AudioPage(),
                binding: BindingsBuilder(
                  () => Get.put<AudioController>(AudioController()),
                ),
                children: [
                  GetPage(
                    name: Paths.audioDetail,
                    page: () => const AudioDetailPage(),
                    binding: BindingsBuilder(
                      () => Get.put<AudioDetailController>(
                          AudioDetailController()),
                    ),
                  )
                ]),
          ])
        ])
  ];
}
