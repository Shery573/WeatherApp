import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/View/Home/controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8, bottom: 10, top: 20),
        child: SizedBox(
          height: 300,
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.blueAccent,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Obx(() => Text(
                            controller.islamabad.location.value,
                            style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            )),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Obx(
                        () => Text(
                          "${controller.islamabad.temperature.toStringAsFixed(0)} °C",
                          style: GoogleFonts.lexendDeca(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Obx(() => Text(
                            "Humidity is ${controller.islamabad.humidity.toStringAsFixed(0)}%",
                            style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            )),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
