import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning_app/api/call_api.dart';
import 'package:elearning_app/api/endpoint.dart';
import 'package:elearning_app/models/audio_detail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class AudioDetailController extends GetxController {
  static AudioDetailController get to => Get.find();

  final argument = Get.arguments;

  final player = AudioPlayer();
  RxBool rxIsPlaying = false.obs;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = Duration.zero.obs;

  RxBool isLoading = false.obs;
  RxBool loadUrl = false.obs;
  AudioDetailModel? audioData;

  @override
  void onInit() async {
    super.onInit();
    await downloadAndSet(Uri.encodeFull(argument['url']));
    await getAudioDetail();

    player.positionStream.listen((event) {
      position.value = event;
    });

    player.durationStream.listen((event) {
      duration.value = event ?? Duration.zero;
    });

    player.playerStateStream.listen((event) {
      if (duration.value == position.value) {
        position.value = Duration.zero;
        player.pause();
        rxIsPlaying.value = false;
        player.seek(position.value);
      }
    });

    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace st) {
      if (e is PlatformException) {
        Get.back();
        Get.snackbar('Error', '${e.message}');
        debugPrint('Error message: ${e.message}');
      } else {
        Get.back();
        Get.snackbar('Error', '$e');
        debugPrint('An error occurred: $e');
      }
    });
  }

  Future<void> downloadAndSet(String uri) async {
    loadUrl.value = true;
    try {
      Dio dio = Dio();
      String url = uri;

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = '${appDocDir.path}/audio.mp3';

      await dio.download(url, savePath);

      await player.setFilePath(savePath);
    } catch (e) {
      Get.back();
      Get.snackbar('Error', '$e');
      debugPrint('Error downloading file: $e');
    }
    loadUrl.value = false;
  }

  Future getAudioDetail() async {
    var url = urlAudioDetail(argument['id']);

    isLoading.value = true;
    await API.get(
      url,
      onSuccess: (json) {
        audioData = AudioDetailModel.fromJson(json);
      },
      onError: (error) {
        log(error.toString());
      },
    );

    isLoading.value = false;
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
      rxIsPlaying.value = false;
    } else {
      player.play();
      rxIsPlaying.value = true;
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    String formattedDate = DateFormat('MMM d').format(dateTime);

    return formattedDate;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
