import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/View/Login/controller.dart';
import 'package:weather_app/routes/app_routes.dart';

import '../../Utilities/Widgets/SnackBar.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  var controller = Get.find<LoginController>();
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
                    "Login",
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
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: TextField(
                    controller: controller.password,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                      await controller.signIn();
                      if (controller.isLoggedIn.value == true) {
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.initialRoute);
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            // ignore: use_build_context_synchronously
                            ViewSnackBar(context, controller.error.value));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Login',
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
