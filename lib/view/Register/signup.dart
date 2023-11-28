import 'package:appstore/route_manager/route_name.dart';
import 'package:appstore/widget/ButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/Model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: Get.height / 1.22,
            color: Colors.white,
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color.fromARGB(230, 244, 244, 244),
                  Colors.transparent,
                  Color.fromARGB(230, 255, 255, 255),
                ])),
            child: Column(
              children: [
                Transform.scale(
                  scaleY: 1.6,
                  scaleX: 1.4,
                  origin: const Offset(-10, -70),
                  child: GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      children: [
                        Container(
                          width: Get.width / 4,
                          height: Get.height / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(signup[2].ima),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: Get.width / 4,
                          height: 600,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(signup[0].ima),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: Get.width / 4,
                          height: Get.height / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(signup[5].ima),
                                  fit: BoxFit.fill)),
                        ),
                      ]),
                ),
                Transform.scale(
                  scaleY: 2.3,
                  scaleX: 1.8,
                  origin: const Offset(0, -120),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 7.3),
                    children: [
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[9].ima),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[3].ima),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[8].ima),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[4].ima),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scaleY: 1.6,
                  scaleX: 1.4,
                  origin: const Offset(-10, -450),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    children: [
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[7].ima),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[1].ima),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: Get.width / 4,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(signup[6].ima),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(-30, -20),
            child: const Text(
              'The shopping \n destination you need',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Auliare',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Transform.translate(
            offset: const Offset(-2, -10),
            child: ButtonWidget(
              title: 'Get started',
              onPressed: () {
                Get.offNamed(RouteNames.register);
              },
            ),
          )
        ],
      ),
    ));
  }
}
