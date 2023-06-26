import 'package:weather_app/View/Login/binding.dart';
import 'package:weather_app/View/Login/login.dart';
import 'package:weather_app/View/Signup/binding.dart';
import 'package:weather_app/View/Signup/signUp.dart';

import '../View/Home/binding.dart';
import '../View/Home/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => Home(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: login,
      page: () => Login(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUp,
      page: () => SignUp(),
      bindings: [
        SignUpBinding(),
      ],
    ),
  ];
}
