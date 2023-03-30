import 'dart:ui';

import 'package:appstore/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const [
                  Icon(
                    Icons.close,
                    color: Rang.blue,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'My Bag',
                    style: TextStyle(
                        color: Rang.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )
                ]),
              ),
              Container(
                color: Colors.blue,
                height: 450,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 190,
                          color: Colors.black26,
                          child: Column(children: [
                            Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.pink,
                                      image: DecorationImage(
                                          image: AssetImage('assets/w1.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('coach',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('coach VFR',
                                          style: TextStyle(
                                              color: Rang.greylight,
                                              fontSize: 15)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Rang.greylight),
                                        height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            children: [
                                              Text('Qnty: $i'.toString()),
                                              IconButton(
                                                  onPressed: (() {
                                                    setState(() {
                                                      i = i + 1;
                                                    });
                                                  }),
                                                  icon: Icon(Icons.add))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('${i * 2000}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              height: 2,
                              thickness: 1,
                              endIndent: 3,
                              indent: 3,
                              color: Rang.blue,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                Text('Move to Wishlist',
                                    style: TextStyle(
                                        color: Rang.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Rang.blue,
                                    thickness: 2,
                                    indent: 3,
                                    endIndent: 1,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Remove',
                                    style: TextStyle(
                                        color: Rang.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                            )
                          ]),
                        ),
                      );
                    })),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Rang.toosi,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Apply Copon Code',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'Check',
                              style: TextStyle(
                                  color: Rang.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Rang.blue)),
                          hintStyle: TextStyle(color: Rang.greylight),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15))),
                    )),
              ),
              ClipPath(
                clipper: cut(x: 60, y: 30),
                child: Container(
                  width: 300,
                  color: Colors.red,
                  child: Column(children: []),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class cut extends CustomClipper<Path> {
  double x, y;
  cut({required this.x, required this.y});
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - x - y, 0)
      ..arcToPoint(Offset(size.width - x, 0),
          clockwise: false, radius: Radius.circular(2))
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - x, size.height)
      ..arcToPoint(Offset(size.width - x - y, size.height),
          clockwise: false, radius: Radius.circular(2));
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(cut oldCLipper) => true;
}
