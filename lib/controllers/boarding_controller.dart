import 'package:carousel_slider/carousel_controller.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/utils.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  static BoardingController get to => Get.find();

  RxInt currentIndex = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final List<String> images = [
    'assets/images/boarding1.png',
    'assets/images/boarding2.png',
    'assets/images/boarding3.png'
  ];

  final List<String> titles = [
    'Upgrade skills,\nShow off credentials!',
    'Gain Insights and read\nTrending Articles',
    'Attend Events and\nExpand your network!'
  ];

  final List<String> descriptions = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.'
  ];

  void onGetStarted() async {
    await Utils.setOnBoarding(show: false);

    final token = await Utils.getToken();
    if (token == null) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offAllNamed(Routes.main);
    }
  }
}
