import 'package:appstore/color/color.dart';
import 'package:appstore/firstScreen/mainScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              child: Column(
                children: const [
                  Text(
                    'Welcome...  ',
                    style: TextStyle(
                        color: Rang.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SpinKitThreeBounce(
                    color: Rang.blue,
                    size: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
