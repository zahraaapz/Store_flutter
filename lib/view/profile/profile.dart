import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/text_style.dart';
import '../../constant/storage.dart';
import '../../widget/ButtonWidgetRevesed.dart';
import '../../widget/profileBox.dart';
import '../../widget/profileProperty.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProfileBox(
              height: Get.height / 6,
              width: Get.width / 1.01,
            ),
          ),
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
                onPressed: () {
                  MyStorage.box.erase();
                  Get.offNamed(RouteNames.root);

              Future<void>del()async{
 
       if (ProfileBox().image!=null) {
        await ProfileBox().image!.delete();
      setState(() {
        ProfileBox().image=null;
      });
           
  
 }


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




