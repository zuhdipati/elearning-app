import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/controllers/course_controller.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/colors.dart';
import 'package:elearning_app/widget/gradient_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = CourseController.to;
    var itemCount = 5;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Course'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => Visibility(
                visible: !controller.isLoading.value,
                replacement: SizedBox(
                    height: Get.height / 1.2,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Title, mentor, or keywords..',
                        hintStyle: const TextStyle(color: formBg, fontSize: 16),
                        contentPadding: const EdgeInsets.all(0),
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 17,
                            fontWeight: FontWeight.w100),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white)),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 50),
                        suffixIconConstraints:
                            const BoxConstraints(minWidth: 50),
                        prefixIcon: SvgPicture.asset(searchSvg),
                        suffixIcon: SvgPicture.asset(filterSvg),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          itemCount,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: tagSmallBg),
                                child: const Text(
                                  "For You",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        controller.courseData.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  Routes.courseDetail(
                                      controller.courseData[index].id),
                                  arguments: controller.courseData[index].id);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 88,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: CachedNetworkImage(
                                        progressIndicatorBuilder:
                                            (context, _, __) {
                                          return SizedBox(
                                            width: context.width / 2,
                                            child: const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive()),
                                          );
                                        },
                                        imageUrl: controller
                                                .courseData[index].path!.isEmpty
                                            ? noImage
                                            : Uri.encodeFull(controller
                                                    .courseData[index]
                                                    .path?[0]
                                                    .url ??
                                                noImage),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller
                                                  .courseData[index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              controller.courseData[index]
                                                          .author ==
                                                      null
                                                  ? Container()
                                                  : Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                    ),
                                              const SizedBox(width: 5),
                                              Text(
                                                  controller.courseData[index]
                                                          .author ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff17b8c1))),
                                                child: const Text(
                                                  "Beginner",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xff17b8c1)),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                height: 16,
                                                width: 16,
                                                decoration: const BoxDecoration(
                                                    color: Colors.grey,
                                                    shape: BoxShape.circle),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            "Sales Hacking: Essential sales skills, sales strategies and sales techniques to sell just about anything!",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: tagSmallBg),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        audioCategorySvg),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      controller
                                                              .courseData[index]
                                                              .category ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              const Text("16",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              const SizedBox(width: 5),
                                              SvgPicture.asset(totalCourseSvg),
                                              const SizedBox(width: 5),
                                              const Text("1.12.22",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                index == controller.courseData.length - 1
                                    ? const SizedBox(
                                        height: 20,
                                      )
                                    : const Column(
                                        children: [
                                          SizedBox(height: 20),
                                          MyDivider(),
                                        ],
                                      )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
