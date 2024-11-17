import 'dart:developer';

import 'package:elearning_app/api/call_api.dart';
import 'package:elearning_app/api/endpoint.dart';
import 'package:elearning_app/models/chapter_model.dart';
import 'package:elearning_app/models/course_detail_model.dart';
import 'package:elearning_app/models/lesson_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CourseDetailController get to => Get.find();

  final argument = Get.arguments;

  LessonModel? lessonData;
  CourseDetailModel? courseDetail;
  List<ChapterModel> chapterDetails = [];

  late FlickManager flickManager;
  late VideoPlayerController videoController;
  late TabController tabController;

  RxBool isLoading = false.obs;
  RxBool loadChapter = false.obs;
  RxBool loadLesson = false.obs;
  RxBool isVideoPlaying = false.obs;
  RxInt indexExtend = (-1).obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Overview'),
    const Tab(text: 'Contents'),
    const Tab(text: 'More Like This'),
  ];

  @override
  void onInit() async {
    super.onInit();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')));

    tabController = TabController(vsync: this, length: myTabs.length);
    await getCourseDetail();
    await getChapter();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future getCourseDetail() async {
    var url = urlCourseDetail(argument);

    isLoading.value = true;
    await API.get(
      url,
      onSuccess: (json) {
        courseDetail = CourseDetailModel.fromJson(json);
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    );

    isLoading.value = false;
  }

  Future getChapter() async {
    if ((courseDetail?.chapter) != null) {
      loadChapter.value = true;
      List<String> idChapter = [];
      for (var i = 0; i < (courseDetail?.chapter.length ?? 0); i++) {
        idChapter.add(courseDetail?.chapter[i].id ?? '');
      }

      List<Future> requests = [];

      for (var id in idChapter) {
        var url = urlCourseChapter(id.toString());

        requests.add(API.get(
          url,
          onSuccess: (json) {
            chapterDetails.add(ChapterModel.fromJson(json));
          },
          onError: (error) {
            debugPrint(error.toString());
          },
        ));
      }

      await Future.wait(requests);
      loadChapter.value = false;
      debugPrint("Chapter Details: $idChapter");
    }
  }

  Future getLesson(String id) async {
    var url = urlCourseLesson(id);

    loadLesson.value = true;
    await API.get(
      url,
      onSuccess: (json) {
        log(json.toString());
        lessonData = LessonModel.fromJson(json);
        playVideo(lessonData?.path[0].url ?? '');
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    );

    loadLesson.value = false;
  }

  void onLessonTap(int index) async {
    String idLesson = '';

    for (var i = 0; i < chapterDetails[index].lesson.length; i++) {
      idLesson = chapterDetails[index].lesson[i].id;
    }

    if (indexExtend.value == index) {
      indexExtend.value = -1;
    } else {
      indexExtend.value = index;
      await getLesson(idLesson);
    }
  }

  void playVideo(String videourl) {
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            videourl)));
  }
}
