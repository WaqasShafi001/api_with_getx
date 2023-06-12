import 'dart:convert';
import 'dart:developer';

import 'package:apiget/UI/Otp/model/otp_model.dart';
import 'package:apiget/UI/login/binding/login_binding.dart';
import 'package:apiget/UI/login/view/loginscreen.dart';
import 'package:apiget/common/apiUrls.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OTPController extends GetxController {
  var isLoading = false.obs;
  Future verifyOTP({String? otpCode}) async {
    isLoading.value = true;
    var body = {
      "email_verification_token": otpCode,
      "device_id": "uuid_of_device"
    };

    try {
      var response = await http.post(
        Uri.parse(
          ApiUrls.baseUrl + ApiUrls.verifyOTPUrl,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      var data = jsonDecode(response.body);
      log('this is our data $data ');

      var result = OTPModel.fromJson(data);

      if (result.success == true) {
        isLoading.value = false;
        Get.off(const LoginPage(), binding: LoginBinding());
      } else {
        isLoading.value = false;
        Get.snackbar(AppTexts.errorText, result.message);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(AppTexts.errorText, e.toString());
    }
  }
}
