
import 'package:appstore/constant/color.dart';
import 'package:appstore/widget/emptyColumn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/string.dart';
import '../../widget/iconANDtitle.dart';

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
            const EmptyColumn(
              image:'assets/image/search.png' ,
              title: MyString.searchEmptytitle,
              content:MyString.searchEmptyContent ,
            )
        
          ]),
        ),
      ),
    );
  }


}
