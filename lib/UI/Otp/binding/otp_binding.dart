import 'package:apiget/UI/Otp/controller/otp_controller.dart';
import 'package:get/get.dart';

class OTPBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<OTPController>(() => OTPController(
    ));
  }
}