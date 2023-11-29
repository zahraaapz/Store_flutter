import 'package:flutter/material.dart';

class Baner extends StatelessWidget {
  const Baner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Image.asset('assets/image/banner/banner.png'),
            Image.asset('assets/image/banner/spring.png'),
          ],
        ));
  }
}