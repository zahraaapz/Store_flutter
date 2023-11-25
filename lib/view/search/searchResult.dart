

import 'package:appstore/constant/color.dart';

import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/string.dart';
import '../../route_manager/route_name.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/contentEmptyPages.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/titleEmtypage.dart';

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
                 
                 iconANDtitle('Search Result', Icons.arrow_back_ios_new),
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
        ButtonWidget(
          onPressed:()=>_onPressed(context),
          title:  'Back to home',
        )
          ]),
        ),
      ),
    );
  }
  _onPressed(context) {
                 Get.offAllNamed(RouteNames.home);
                }

}
