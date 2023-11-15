import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool isLoading = false.obs;

  void getLogin() async {
    isLoading.value = true;
    try {
      final response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      });
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar("Login Successfull", "Congratulations");
      } else {
        isLoading.value = false;

        Get.snackbar("Login Failed", data['error']);
      }
    } catch (e) {
      print(e);
    }
  }
}
