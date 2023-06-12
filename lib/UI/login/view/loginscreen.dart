import 'package:apiget/UI/login/controller/login_controller.dart';
import 'package:apiget/UI/signup/binding/signUpBinding.dart';
import 'package:apiget/UI/signup/view/Signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
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
                      TextFormField(
                        controller: controller.emailController.value,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
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
                            onPressed: () => controller.validateAndLogin(),
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            onPressed: () => Get.off(const SignupScreen(),
                                binding: SignUpBinding()),
                            child: const Text('Sign up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
    );
  }

//void _login(BuildContext context, {String? email, String? password}) async {
//try {
//if (email == null || email.isEmpty || password == null || password.isEmpty) {
//  throw 'Please enter a valid email and password';
// }

// bool isStrongPassword(String password) {
// Implement your password strength validation logic here
// For example, you can check for a minimum length, presence of uppercase, lowercase, digits, and special characters
// return password.length >= 6 &&
//  RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()])').hasMatch(password);
//  }

//if (!isStrongPassword(password)) {
//  throw 'Please enter a valid password';
//  }
// print('Navigating to HomeScreen');
// Navigator.pushReplacement(
// context,
//  MaterialPageRoute(builder: (context) => Homescreen()),
// );
//} catch (error) {
//  throw error;
//  }
//  }
}
