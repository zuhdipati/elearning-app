import 'package:elearning_app/controllers/course_detail_controller.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/colors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CourseDetailController.to;
    return SafeArea(
      child: DefaultTabController(
        length: controller.myTabs.length,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Obx(() => Visibility(
                visible: !controller.isLoading.value,
                replacement: SizedBox(
                    height: Get.height / 1.2,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )),
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                            backgroundColor: Colors.black,
                            floating: true,
                            pinned: true,
                            expandedHeight: 460,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Column(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: Get.width,
                                    child: Obx(() => Visibility(
                                        visible: !controller.loadLesson.value,
                                        replacement: const SizedBox(
                                            child: Center(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        )),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: FlickVideoPlayer(
                                              flickManager:
                                                  controller.flickManager),
                                        ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 16),
                                            decoration: BoxDecoration(
                                                color: tagSmallBg,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                    audioCategorySvg),
                                                const SizedBox(width: 8),
                                                const Text(
                                                  'AI',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            const Text("Created by ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                            const Text("Diego Davila",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14)),
                                            const Spacer(),
                                            SvgPicture.asset(enLanguageSvg),
                                            const Text(" in ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                            const Text("English",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                            '4 Chapters, 10 Lessons, 30m 15s Total Length',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14)),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            forceElevated: innerBoxIsScrolled,
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(48.0),
                              child: Container(
                                height: 40,
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                                child: TabBar(
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  labelColor: Colors.white,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  indicator: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: formBg),
                                  controller: controller.tabController,
                                  tabs: controller.myTabs,
                                  automaticIndicatorColorAdjustment: true,
                                  dividerColor: Colors.transparent,
                                ),
                              ),
                            )),
                      )
                    ];
                  },
                  body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: [
                        Container(),
                        CustomCard(controller: controller),
                        Container(),
                      ]),
                ),
              )),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.controller});
  final CourseDetailController controller;

  @override
  Widget build(BuildContext context) {
    List color = [tagSmallBg, formBg];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Obx(() => Visibility(
            visible: !controller.loadChapter.value,
            replacement: SizedBox(
                height: Get.height / 2,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
            child: Column(
              children: [
                Container(color: formBg, height: 60),
                Column(
                    children: List.generate(controller.chapterDetails.length,
                        (index) {
                  List chapterName = [];
                  for (var i = 0;
                      i < controller.chapterDetails[index].coursesId.length;
                      i++) {
                    chapterName.add(
                        controller.chapterDetails[index].coursesId[i].title);
                  }
                  return GestureDetector(
                    onTap: () {
                      controller.onLessonTap(index);
                    },
                    child: Obx(() => AnimatedSize(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            height: controller.indexExtend.value == index
                                ? null
                                : 100,
                            padding: const EdgeInsets.all(16),
                            color: color[index % color.length],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.chapterDetails[index].title,
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                    const Spacer(),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${controller.chapterDetails[index].lesson.length} Lessons',
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                    const Text(
                                      '• 18 min',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  chapterName
                                      .toString()
                                      .replaceAll(RegExp(r'[\[\]]'), ''),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                })),
              ],
            ),
          )),
    );
  }
}
