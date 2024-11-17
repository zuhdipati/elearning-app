import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/controllers/audio_detail_controller.dart';
import 'package:elearning_app/services/assets.dart';
import 'package:elearning_app/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AudioDetailPage extends StatelessWidget {
  const AudioDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = AudioDetailController.to;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.keyboard_arrow_down, size: 35)),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("PLAYING FROM SEARCH", style: TextStyle(fontSize: 14)),
            Text("Judul", style: TextStyle(fontSize: 16)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() => Visibility(
              visible: !controller.loadUrl.value &&
                  !controller.isLoading.value &&
                  controller.audioData != null,
              replacement: SizedBox(
                  height: Get.height / 1.2,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: Get.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, _, __) {
                        return SizedBox(
                          width: context.width / 2,
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()),
                        );
                      },
                      imageUrl: controller.audioData?.thumbnail?[0].url ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.audioData?.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.audioData?.artist ?? '',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 3,
                                  width: 3,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  controller.audioData?.jobTitle ?? '',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        headphoneSvg,
                        width: 22,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.play_arrow,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: tagSmallBg),
                        child: Row(
                          children: [
                            SvgPicture.asset(audioCategorySvg),
                            const SizedBox(width: 5),
                            const Text("Category Name",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                      const Spacer(),
                      controller.audioData?.createdAt == null
                          ? Container()
                          : Text(controller.formatDate(
                              controller.audioData?.createdAt?.toString() ??
                                  '')),
                      const SizedBox(width: 5),
                      Container(
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 5),
                      Text("in ${controller.audioData?.languange}")
                    ],
                  ),
                  const SizedBox(height: 10),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                      trackHeight: 4,
                      thumbColor: Colors.white,
                      activeTrackColor: Colors.white,
                    ),
                    child: Obx(() => ProgressBar(
                          buffered: controller.player.bufferedPosition,
                          progress: controller.position.value,
                          total: controller.duration.value,
                          progressBarColor: Colors.white,
                          baseBarColor: Colors.white.withOpacity(0.24),
                          bufferedBarColor: Colors.white.withOpacity(0.24),
                          thumbColor: Colors.white,
                          barHeight: 3.0,
                          thumbRadius: 5.0,
                          onSeek: (duration) {
                            controller.player.seek(duration);
                          },
                        )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined, size: 40)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous, size: 55)),
                      GestureDetector(
                        onTap: controller.handlePlayPause,
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Obx(() => Icon(
                                  controller.rxIsPlaying.value
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.black,
                                  size: 50,
                                ))),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next, size: 55)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border, size: 40)),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class DurationState {
  const DurationState(
      {required this.progress, this.buffered, required this.total});
  final Duration progress;
  final Duration? buffered;
  final Duration total;
}
