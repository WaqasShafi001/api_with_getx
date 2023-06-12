import 'package:apiget/UI/Otp/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpPage extends GetView<OTPController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Center(
            child: controller.isLoading.value
                ? const CircularProgressIndicator.adaptive()
                : OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) => controller.verifyOTP(
                        otpCode: verificationCode), // end onSubmit
                  ),
          ),
        ),
      ),
    );
  }
}
