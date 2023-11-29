import 'package:flutter/material.dart';

import '../../model/Model.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key, this.size}) : super(key: key);

  final size;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: brands.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(brands[index].ima))),
              width: size.width / 6,
              height: size.height / 20,
            ),
          );
        }));
  }
}