import 'package:appstore/constant/color/color.dart';

import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constant/text_style.dart';


class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 
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
    return  SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'Wellcome...  '

                    ,style: textStyle.headlineSmall,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SpinKitCircle(
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
