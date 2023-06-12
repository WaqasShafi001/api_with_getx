import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:apiget/UI/Otp/binding/otp_binding.dart';
import 'package:apiget/UI/signup/model/signUpModel.dart';
import 'package:apiget/common/apiUrls.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/appColors.dart';
import '../../Otp/view/otp_view.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  void validateFields() {
  
    if (nameController.value.text.isEmpty) {
      Get.snackbar(
        AppTexts.errorText,
        'Name can not be empty',
        backgroundColor: AppColors.smallCardColor,
      );
    } else if (emailController.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Email can not be empty');
    } else if (!emailController.value.text.isEmail) {
      Get.snackbar(AppTexts.errorText, 'Email format is wrong');
    } else if (passwordController.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Password can not be empty');
    } else {
      signUpApiCall();
    }
  }

  Future signUpApiCall() async {
      isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    var body = {
      "first_name": nameController.value.text,
      "last_name": "Renter",
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "fcm_token": "fcm_of_device1",
      "device_id": "uuid_of_device1",
      "role_id": 3,
      "date_of_birth": "2000-01-01 00:00:00",
      "time_zone": "Asia/Karachi",
      "longitude": null,
      "latitude": null,
      "country": null,
      "zip_code": null
    };

    try {
      var response = await http.post(
        Uri.parse(
          ApiUrls.baseUrl + ApiUrls.singUpUrl,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      log('this is our response $response ');

      var data = jsonDecode(response.body);
      log('this is our data $data ');

      var result = SignupModel.fromJson(data);

      if (result.success == true) {
        log('status 200');
        isLoading.value = false;

        log('result is =========== $result');

        log('user id = ${result.signupData.user.id} ===  user name = ${result.signupData.user.firstName} ===  user email = ${result.signupData.user.email}');
        prefs.setString('token', result.signupData.accessToken);
        Get.to(const OtpPage(), binding: OTPBinding());
      } else {
        isLoading.value = false;
        log(' status code in else case ${response.statusCode}');
        Get.snackbar(AppTexts.errorText, result.message);
      }
    } on SocketException catch (s) {
      isLoading.value = false;
      log(s.toString());
    } on FormatException catch (f) {
      isLoading.value = false;
      log(f.toString());
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      Get.snackbar(AppTexts.errorText, e.toString());
    }
  }

  Future sendOTP() async {}
}
