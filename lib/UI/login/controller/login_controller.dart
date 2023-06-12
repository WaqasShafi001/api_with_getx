import 'dart:convert';
import 'dart:developer';

import 'package:apiget/UI/Homescreen.dart';
import 'package:apiget/UI/login/model/login_model.dart';
import 'package:apiget/common/apiUrls.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  void validateAndLogin() {
    if (emailController.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Email can not be empty');
    } else if (!emailController.value.text.isEmail) {
      Get.snackbar(AppTexts.errorText, 'Email format is wrong');
    } else if (passwordController.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Password can not be empty');
    } else {
      loginApiCall();
    }
  }

  Future loginApiCall() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    var body = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "fcm_token": "fcm_of_device2",
      "device_id": "uuid_of_device2",
      "time_zone": "Asia/Karachi",
      "longitude": null,
      "latitude": null,
      "country": null,
      "zip_code": null
    };
    try {
      var response = await http.post(
        Uri.parse(
          ApiUrls.baseUrl + ApiUrls.loginUrl,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      var data = jsonDecode(response.body);

      var result = LoginModel.fromJson(data);

      if (result.success == true) {
        prefs.setString('token', result.loginData.accessToken);
        log('this is token at login page == ${prefs.setString('token', result.loginData.accessToken)}');
        isLoading.value = false;
        Get.off(const Homescreen());
      } else {
        isLoading.value = false;
        Get.snackbar(AppTexts.errorText, result.message);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
