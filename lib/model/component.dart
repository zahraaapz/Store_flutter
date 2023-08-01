  import 'package:flutter/material.dart';

import '../color/color.dart';

ButtonStyle buttonModel() {
    return ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Rang.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))));
  }

    Text contentEmptyPages(String title) {
    return Text(
           title,
            textAlign: TextAlign.center,
            strutStyle: StrutStyle(height: 2),
          );
  }

    Text titleEmtypage(String title) {
    return Text(
            'Whoops!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          );
  }

    Padding iconANDtitle(String title,IconData icon) {
    return Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(
                    Icons.close,
                    color: Rang.blue,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(
                        color: Rang.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )
                ]),
              );
  }