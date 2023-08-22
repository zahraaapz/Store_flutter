

import 'package:appstore/color/color.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';

import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/component.dart';
import '../../model/string.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, });
 
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 
                  GestureDetector(
                    onTap: ()=>Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Rang.blue,size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                   Text(
                    'Search results'
                  ,style: textStyle.displaySmall,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
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
            Image.asset('assets/image/search.png'),
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
                child:  Text(
                  'Back to home',
                 style: textStyle.headlineLarge,
                )
              ),
            )
          ]),
        ),
      ),
    );
  }


}
