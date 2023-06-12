import 'package:apiget/UI/login/binding/login_binding.dart';
import 'package:apiget/UI/login/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: ()  async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('token');
              Get.offAll(const LoginPage(), binding: LoginBinding());

            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome'),
      ),
    );
  }
}
