import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Models/AuthAPI.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoggedIn = false.obs;
  RxString error = ''.obs;
  final AuthAPI _authAPI = AuthAPI(); // Instantiate AuthAPI

  Future<void> signIn() async {
    try {
      final String result = await _authAPI.signIn(email.text, password.text);
      if (!result.contains('Error')) {
        isLoggedIn.value = true;
      } else {
        error.value = result;
        print(result);
      }
    } on SocketException {
      error.value = 'No Internet connection';
      print(error.value);
    } catch (e) {
      error.value = 'An unexpected error occurred: $e';
      print(error.value);
    }
  }
}
