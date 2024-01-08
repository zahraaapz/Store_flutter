import 'dart:io';

import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../component/storage.dart';
import '../../component/text_style.dart';
import '../../widget/ButtonWidgetRevesed.dart';
import '../../widget/profileBox.dart';
import '../../widget/profileProperty.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


String? appDocPath;
File? image;

  Future<void> getApplicationDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    appDocPath = directory.path;
  }

  @override
  void initState() {
    super.initState();
    getApplicationDirectory();
  }




  Future _getImage() async {
    final pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    image = File(pickedfile!.path);

    final File localImage = await image!.copy('$appDocPath/bg');

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
 Image? ima;
    var hasLocalImage = File('$appDocPath/bg').existsSync();
    if (hasLocalImage) {
          var byte = File('$appDocPath/bg').readAsBytesSync();
            ima = Image.memory(
        byte,
        width: 100,
        height: 110,
        fit: BoxFit.fill,
      );
    }
  
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Profile', style: textStyle.displaySmall),
              ],
            ),
          ),
      profileBox(ima,_getImage),
      
          profileProperty(
              'Personal Informantion', () => Get.toNamed(RouteNames.personal)),
          profileProperty(
              'My Address Book', () => Get.toNamed(RouteNames.address)),
          profileProperty('My Saved Cards', () {}),
          profileProperty('My Order', () {}),
          profileProperty('Refer and Earn', () {}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ButtonWidgetRevesed(
                onPressed: ()async {
                  MyStorage.box.erase();
                  Get.offNamed(RouteNames.root);
              try {
                  if (File('$appDocPath/bg').existsSync()) {
                    await File('$appDocPath/bg').delete();
                    setState(() {
                      ima = null;
                    });
                  }
                } catch (e) {
                  // Error in getting access to the file.
                  print('$e');
                }



                },
                title: 'Log Out',
                iconData: Icons.exit_to_app,
              ),
            ),
          )
        ]),
      ),
    );
  }


}




