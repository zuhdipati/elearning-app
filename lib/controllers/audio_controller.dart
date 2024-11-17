import 'package:elearning_app/api/call_api.dart';
import 'package:elearning_app/api/endpoint.dart';
import 'package:elearning_app/models/audio_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  static AudioController get to => Get.find();

  RxBool isLoading = false.obs;
  List<AudioModel> audioData = [];

  @override
  void onInit() {
    super.onInit();
    getAudio();
  }

  void getAudio() async {
    var url = urlAudio;

    isLoading.value = true;
    await API.get(
      url,
      onSuccess: (json) {
        audioData = List<AudioModel>.from(
          json.map((item) => AudioModel.fromJson(item)),
        );
      },
      onError: (error) {
        debugPrint(error.toString());
      },
    );

    isLoading.value = false;
  }

  int parseToMinutes(int milliseconds) {
    return (milliseconds / (1000 * 60)).round();
  }

  double parseMillisecondsToSeconds(int milliseconds) {
    return milliseconds / 1000;
  }
}
