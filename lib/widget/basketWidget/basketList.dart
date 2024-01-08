import 'package:appstore/component/extention.dart';
import 'package:flutter/material.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../constant/dim.dart';
import '../../model/model.dart';

class BasketList extends StatelessWidget {
  BasketList({
    super.key,
    required this.size,
    required this.qnty,
    required this.index,
    required this.inc,
    required this.remove,
    required this.reduce,
  });
  var size;
  List<int> qnty;
  int index;
  VoidCallback inc;
  VoidCallback reduce;
  VoidCallback remove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height / 4,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 1.6)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: size.height / 6,
                width: size.width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(myBagList[index].ima!),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(myBagList[index].brand!, style: textStyle.bodyMedium),
                    (Dim.large / 2).height,
                    Text(myBagList[index].name!, style: textStyle.bodyMedium),
                    (Dim.large / 2).height,
                    Container(
                      color: Rang.toosi,
                      height: size.height / 20,
                      child: Row(
                        children: [
                          Text(
                              style: textStyle.bodyMedium,
                              'Qnty: ${qnty[index]}'),
                          IconButton(
                              onPressed: inc, icon: const Icon(Icons.add)),
                          IconButton(
                            onPressed: reduce,
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                    (Dim.large / 2).height,
                    Text(
                        style: textStyle.bodyMedium,
                        '${int.parse(myBagList[index].price!) * qnty[index]}\$'),
                  ],
                ),
              )
            ],
          ),
          (Dim.large / 2).height,
          const Divider(
            height: 1,
            thickness: 1,
            endIndent: 3,
            indent: 3,
            color: Rang.blue,
          ),
          (Dim.large / 4).height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Dim.small).width,
              Center(
                  child:
                      Text('Move to Wishlist', style: textStyle.displaySmall)),
              (Dim.small).width,
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Rang.blue,
                  thickness: 1,
                  indent: 3,
                  endIndent: 1,
                ),
              ),
              (Dim.small).width,
              InkWell(
                onTap: remove,
                child: Text(
                  'Remove',
                  style: textStyle.displaySmall,
                ),
              ),
              (Dim.large * 2).width,
            ],
          )
        ]),
      ),
    );
  }
}