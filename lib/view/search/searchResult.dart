import 'dart:ui';

import 'package:appstore/color/color.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';

import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

import '../../model/component.dart';
import '../../model/string.dart';

class Searchresult extends StatelessWidget {
  Searchresult({super.key, });
 
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
               
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Rang.blue,size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
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
          const SizedBox(
            height: 90,
          ),
          Image.asset('assets/search.png'),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleEmtypage(MyString.searchEmptytitle),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: contentEmptyPages(MyString.searchEmptyContent)
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Home())));
              }),
              style: buttonModel(),
              child: const Text(
                'Back to home',
                style: TextStyle(color: Colors.white),
              )
            ),
          )
        ]),
      ),
    );
  }


}
