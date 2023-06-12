import 'dart:developer';

import 'package:apiget/UI/Homescreen.dart';
import 'package:apiget/UI/signup/binding/signUpBinding.dart';
import 'package:apiget/UI/signup/view/Signupscreen.dart';
import 'package:apiget/common/assetNames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token = '';
  @override
  void initState() {
    getToken();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      token!.isEmpty
          ? Get.off(const SignupScreen(), binding: SignUpBinding())
          : Get.off(Homescreen());
    });
    super.initState();
  }

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    token == null ? token = '' : token = prefs.getString('token');
    log('this is token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetNames.splashImage),
      ),
    );
  }
}


// Getx Navigations
// 1 - Get.to(SignupScreen(), binding); from one page to another, maintains navigated stack of screens
// 2 - Get.off(SignupScreen(), binding);  from one page to another And remove the navigated screen 
// 3 - Get.offAll(SignupScreen(), binding); 
// 4 - Get.back(),