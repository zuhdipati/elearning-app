import 'dart:developer';

import 'package:elearning_app/api/call_api.dart';
import 'package:elearning_app/api/endpoint.dart';
import 'package:elearning_app/routes/app_routes.dart';
import 'package:elearning_app/services/utils.dart';
import 'package:elearning_app/widget/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      emailController.text = 'jhon@test.com';
      passwordController.text = 'test';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(String email, String password) async {
    var body = {'email': email, 'password': password};
    var url = urlLogin;

    showLoading();

    try {
      await API.login(
        email,
        password,
        body,
        url,
        onSuccess: (value) async {
          log(value.toString());
          log(value['token']);
          await Utils.setToken(value['token']);

          hideLoading();
          resetTextController();
          Get.offAllNamed(Routes.main);
        },
        onError: (error) {
          hideLoading();
          log(error.toString());
        },
      );
    } catch (e) {
      hideLoading();
      log(e.toString());
    }
  }

  void resetTextController() {
    emailController.text = "";
    passwordController.text = "";
  }
}
