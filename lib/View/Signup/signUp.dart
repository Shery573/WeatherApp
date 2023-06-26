import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/View/Signup/controller.dart';

import '../../Utilities/Widgets/SnackBar.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  var controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 80,
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0, top: 40),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                      fontSize: 33,
                      color: Colors.white,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    style: const TextStyle(color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextField(
                    controller: controller.password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    style: const TextStyle(color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: TextField(
                    controller: controller.rePassword,
                    decoration: InputDecoration(
                      hintText: 'Re-enter password',
                    ),
                    style: const TextStyle(color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ));
                      await controller.signUp();
                      if (controller.matchPassword() == true) {
                        if (controller.isRegistered.value == true) {
                          Navigator.pop(context);
                          Get.toNamed('/login');
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              ViewSnackBar(context, controller.error.value));
                          print(controller.error.value);
                        }
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(ViewSnackBar(
                            context, controller.snackBarText.value));
                        // print(controller.error.value);
                      }
// controller.register();
// print(controller.error.value);
// if (controller.isRegistered.value ==true){
//   Get.toNamed('/login');
// }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.lexendDeca(
                            textStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
