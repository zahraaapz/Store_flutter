

import 'package:appstore/component/extention.dart';
import 'package:appstore/widget/firstscreenWidget/bottomsheetSuggest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/dim.dart';
import '../../component/text_style.dart';




class SuggList extends StatefulWidget {
  SuggList({
    super.key,
     this.controller,
     this.size,
     required this.select
  });
var controller;

var size;

RxInt select;
  @override
  State<SuggList> createState() => _SuggListState();
}

class _SuggListState extends State<SuggList> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height / 4.3,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.controller.suggestlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                bottomSheetForSuggestList(widget.select,widget.controller,context,index);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: widget.size.height / 9,
                      width:widget. size.width / 3.5,
                      ////container suggestlist
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                widget.controller.suggestlist[index].ima!,
                              ).image)),
                    ),
                    SizedBox(
                      width: widget.size.width / 3.5,
                      height: widget.size.height / 19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.controller.suggestlist[index].name!,
                              style: textStyle.bodyMedium),
                        ],
                      ),
                    ),
                    Text(widget.controller.suggestlist[index].brand!,
                        style: textStyle.bodyMedium),
                       (Dim.small).height,

                    Text("${widget.controller.suggestlist[index].price}\$",
                        style: textStyle.bodyMedium),
                  ],
                ),
              ),
            );
          }),
    );
  }

}