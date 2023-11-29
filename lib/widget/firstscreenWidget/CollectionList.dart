import 'package:flutter/material.dart';

import '../../model/Model.dart';

class CollectionList extends StatelessWidget {
  const CollectionList({Key? key, this.size}) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

        ///collection
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1, crossAxisCount: 2),
        itemCount: cateList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              width: size.width / 3,
              height: size.height / 7,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(cateList[index].ima)),
              ),
            ),
          );
        });
  }
}