import 'package:appstore/component/extention.dart';
import 'package:flutter/material.dart';

import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';

class Shortcut extends StatelessWidget {
  const Shortcut({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width / 1.12,
          height: size.height / 4.7,
          decoration: BoxDecoration(
              color: Rang.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Positioned(
        left: 20,
        top: 40,
        child: Row(
          children: [
            Container(
              width: size.width / 3.5,
              height: size.height / 7,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/image/PWA-CTA.png',
                      )),
                  borderRadius: BorderRadius.circular(10)),
            ),
             (Dim.small).width,
            SizedBox(
              width: size.width / 2.2,
              child: const Text(
                  '''Discover your favrouite products faster with CORA’L web app.''',
                  strutStyle: StrutStyle(height: 1.7),
                  style: TextStyle(
                      fontFamily: 'Auliare',
                      fontSize: 14,
                      color: Colors.white)),
            )
          ],
        ),
      ),
      const Positioned(
          left: 150,
          top: 50,
          child: Text(
            '',
            style: TextStyle(color: Colors.white),
          )),
      Positioned(
        bottom: 20,
        left: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Add shortcut ', style: textStyle.headlineLarge),
            const Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      )
    ]);
  }
}