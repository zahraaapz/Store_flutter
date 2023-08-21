import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color/color.dart';
import 'model/component.dart';
import 'view/profile/personal_info.dart';

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
                   Text(
                    'Notification',style: textStyle.displaySmall,
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
              Image.asset('assets/image/notf.png'),
              SizedBox(
                height: 20,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 36,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upto 50% OFF⚡⚡',style: textStyle.bodyMedium),
                      const SizedBox(
                        height: 20,
                      ),
                       Text('This winter gift your loved ones.',style: textStyle.bodyMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Rang.blue, width: 1.5)),
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
                     style: textStyle.displaySmall,
                    )),
              ),
              const SizedBox(
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
                      Image.asset('assets/image/icon.png'),
                      Text('Share your feedback',style: textStyle.bodyMedium),
                      SizedBox(
                        height: 20,
                      ),
                      Text(style: textStyle.bodyMedium,
                        '''Hey, ${Personal().box.read('fullName')}. Thanks for using CORAL. You know what? You can help us improve with just one click''',
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
