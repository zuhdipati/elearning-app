import 'package:elearning_app/api/call_api.dart';
import 'package:elearning_app/api/endpoint.dart';
import 'package:elearning_app/models/course_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.find();

  RxBool isLoading = false.obs;
  List<CourseModel> courseData = [];

  @override
  void onInit() async {
    await getCourse();
    super.onInit();
  }

  Future getCourse() async {
    var url = urlCourse;

    isLoading.value = true;
    await API.get(
      url,
      onSuccess: (json) {
        courseData = List<CourseModel>.from(
          json.map((item) => CourseModel.fromJson(item)),
        );
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    );

    isLoading.value = false;
  }
}
