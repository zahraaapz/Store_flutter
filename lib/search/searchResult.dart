import 'dart:ui';

import 'package:appstore/color/color.dart';
import 'package:appstore/selectType/Handbags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchresult extends StatelessWidget {
  Searchresult({super.key, required this.select});
  int select;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Rang.blue,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Text(
                  'Search results',
                  style: TextStyle(
                      color: Rang.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
                const Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Rang.blue,
                )
              ],
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Image.asset('assets/art.png'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Whoops!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'We cccccccccccccccccc gjjjjjjjjj k ll ujl ghgjgj jyjj vbnbn hjh j jjll jljljl joj',
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(height: 2),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Handbags(
                              select: select,
                            ))));
              }),
              child: const Text(
                'Back to home',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Rang.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
            ),
          )
        ]),
      ),
    );
  }
}
