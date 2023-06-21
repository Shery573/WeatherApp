import '../View/Home/binding.dart';
import '../View/Home/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => Home(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
