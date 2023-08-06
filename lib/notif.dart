import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'color/color.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Rang.blue,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Notification',
                    style: TextStyle(
                        color: Rang.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Rang.blue,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset('assets/notf.png'),
              SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 36,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upto 50% OFF⚡⚡'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('This winter gift your loved ones.'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Rang.blue, width: 1.5)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Rang.blue;
                          }
                          return Colors.white;
                        })),
                    onPressed: () {},
                    child: Text(
                      'Shop now',
                      style: TextStyle(color: Rang.blue),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                color: Rang.toosi,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/icon.png'),
                      Text('Share your feedback'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '''Hey, Tina. Thanks for using CORAL. You know what? You can help us improve with just one click''',
                        textScaleFactor: 1.1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
