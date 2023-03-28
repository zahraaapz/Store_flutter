import 'package:appstore/firstScreen/extractMainScreen.dart';
import 'package:appstore/model/Model.dart';

import 'package:appstore/profile/profile.dart';

import 'package:appstore/color/color.dart';
import 'package:appstore/review/review.dart';
import 'package:appstore/wish/wishlist.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectpg = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          IndexedStack(index: selectpg, children: [
            Extractmainscreen(),
            Profile(),
          ]),
          Buttonbar(
              selectpg: selectpg,
              changeScreen: (int newpg) {
                setState(() {
                  selectpg = newpg;
                });
              }),
        ]),
      ),
    );
  }
}

class Buttonbar extends StatefulWidget {
  Buttonbar({Key? key, required this.changeScreen, required this.selectpg})
      : super(key: key);
  final Function(int n) changeScreen;
  var selectpg;

  @override
  State<Buttonbar> createState() => _ButtonbarState();
}

class _ButtonbarState extends State<Buttonbar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < ikon.length; i++)
              IconButton(
                  onPressed: (() {
                    widget.changeScreen(i);
                  }),
                  icon: Icon(
                    ikon[i],
                    color: widget.selectpg == i ? Rang.blue : Rang.greylight,
                    size: widget.selectpg == i ? 27 : 23,
                  )),
          ],
        ),
      ),
    );
  }
}
