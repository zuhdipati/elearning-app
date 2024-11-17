import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/controllers/audio_controller.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/colors.dart';
import 'package:elearning_app/widget/gradient_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AudioController.to;
    final tt = context.textTheme;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Audio Book'),
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
            child: Obx(
              () => Visibility(
                visible: !controller.isLoading.value,
                replacement: SizedBox(
                    height: Get.height / 1.3,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search Keywords',
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
                    Text(
                      "Best-sellers",
                      style: tt.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.audioData.length,
                          (index) {
                            return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      Routes.audioDetail(
                                          controller.audioData[index].id),
                                      arguments: {
                                        'id': controller.audioData[index].id,
                                        'url': controller
                                            .audioData[index].path[0].url
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: index ==
                                              controller.audioData.length - 1
                                          ? 0
                                          : 30),
                                  child: SizedBox(
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 185,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder:
                                                (context, _, __) {
                                              return SizedBox(
                                                width: context.width / 2,
                                                child: const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive()),
                                              );
                                            },
                                            imageUrl: Uri.encodeFull(controller
                                                .audioData[index]
                                                .thumbnail[0]
                                                .url),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          controller.audioData[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          controller.audioData[index].artist,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "More Books",
                      style: tt.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Column(
                      children: List.generate(
                        controller.audioData.length,
                        (index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                                Routes.audioDetail(
                                    controller.audioData[index].id),
                                arguments: {
                                  'id': controller.audioData[index].id,
                                  'url': controller.audioData[index].path[0].url
                                }),
                            child: Column(
                              children: [
                                const SizedBox(height: 25),
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
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
                                        imageUrl: Uri.encodeFull(controller
                                            .audioData[index].thumbnail[0].url),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.audioData[index].title,
                                            style:
                                                const TextStyle(fontSize: 14)),
                                        Text(
                                            "by ${controller.audioData[index].artist}",
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        const SizedBox(height: 10),
                                        const Text("0 Chapter",
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 60,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(height: 5),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Icon(Icons.bookmark_border),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(durationSvg),
                                              const SizedBox(width: 5),
                                              Text(
                                                controller.audioData[index]
                                                            .time <
                                                        6000
                                                    ? "${controller.parseMillisecondsToSeconds(controller.audioData[index].time)} Sec"
                                                    : "${controller.parseToMinutes(controller.audioData[index].time)} Mins",
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                index == controller.audioData.length - 1
                                    ? const SizedBox(
                                        height: 20,
                                      )
                                    : const Column(
                                        children: [
                                          SizedBox(height: 25),
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
              ),
            ),
          ),
        ));
  }
}
