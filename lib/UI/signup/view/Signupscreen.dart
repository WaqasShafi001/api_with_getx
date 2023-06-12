import 'package:apiget/UI/login/binding/login_binding.dart';
import 'package:apiget/UI/login/view/loginscreen.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:apiget/common/assetNames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signupController.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage(AssetNames.placeHolder),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.nameController.value,
                      decoration: const InputDecoration(
                        labelText: AppTexts.name,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.emailController.value,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.passwordController.value,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => controller.validateFields(),
                          child: const Text('Sign Up'),
                        ),
                
                        ElevatedButton(
                          onPressed: () =>
                              Get.to(const LoginPage(), binding: LoginBinding()),
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
