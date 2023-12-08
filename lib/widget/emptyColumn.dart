
import '../../widget/ButtonWidget.dart';
import '../../widget/contentEmptyPages.dart';
import 'package:flutter/material.dart';
import '../../widget/titleEmtypage.dart';
import 'package:appstore/component/extention.dart';
import '../../component/dim.dart';

class EmptyColumn extends StatelessWidget {
  const EmptyColumn({super.key, this.image, this.title, this.content});
  final String? image;
  final String? title;
  final String? content;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (Dim.large * 2 - 10).height,
        Image.asset(image!),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: titleEmtypage(title!),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: contentEmptyPages(content!),
        ),
        (Dim.large * 5).height,
        ButtonWidget(
         onPressed: () =>  _onPressed(),
          title: 'continue shopping',
        )
      ],
    );
    

  }
    _onPressed() {

 
  }
}
