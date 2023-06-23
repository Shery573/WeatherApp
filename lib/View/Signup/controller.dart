import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Models/AuthAPI.dart';

class SignUpController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  RxBool isDoctor = false.obs;
  var isLoggedIn = false;
  var snackBarText = ''.obs;
  var isRegistered = false.obs;
  var error = ''.obs;
  String? accessToken = '';
  String? providerId = '';
  int? token = 0;
  String? signInMethod = '';
  final AuthAPI _authAPI = AuthAPI(); // Instantiate AuthAPI

  bool matchPassword() {
    if (password.text == rePassword.text && password.text != '') {
      return true;
    } else {
      snackBarText.value = 'Passwords do not match';
      return false;
    }
  }

  Future<void> signUp() async {
    if (matchPassword()) {
      final String result = await _authAPI.signUp(email.text, password.text);
      if (!result.contains('Error')) {
        isLoggedIn = true;
        isRegistered.value = true;
      } else {
        error.value = result;
        print(result);
      }
    }
  }
}
