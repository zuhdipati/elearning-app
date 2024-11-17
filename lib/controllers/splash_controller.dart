import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      showOnBoarding();
    });

    //   var token = await Utils.getToken();
    // if (token != null) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offAllNamed(Routes.main);
    //   });
    // } else {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offAllNamed(Routes.login);
    //   });
    // }
  }

  void showOnBoarding() async {
    final show = await Utils.getBoolOnBoarding();

    if (show == true || show == null) {
      await Get.offAllNamed(Routes.boarding);
    } else {
      final token = await Utils.getToken();
      if (token == null) {
       await Get.offAllNamed(Routes.login);
      } else {
       await Get.offAllNamed(Routes.main);
      }
    }
  }
}
