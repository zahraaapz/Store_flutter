import 'dart:io';
import 'package:appstore/component/extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../component/dim.dart';
import '../component/text_style.dart';
import '../constant/color.dart';
import '../constant/storage.dart';
class ProfileBox extends StatefulWidget {
 ProfileBox({super.key,this.height,this.width});
final height;
final width;
File? image;
  @override
  State<ProfileBox> createState() => _ProfileBoxState(image);

  
}

class _ProfileBoxState extends State<ProfileBox> {

String ? appDocPath;
File? image;

_ProfileBoxState(this.image);

Future<void> getApplicationDirectory()async{
 Directory directory=await getApplicationDocumentsDirectory();
appDocPath=directory.path;
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationDirectory();
  }
Future _getImage()async{



final pickedfile=await ImagePicker().pickImage(source:ImageSource.gallery);


image=File(pickedfile!.path);


final File localImage=await image!.copy('$appDocPath/bg');

setState(() {

});


}


  @override
  Widget build(BuildContext context) {

    return Container(
            height: widget.height ,
            width: widget.width ,
            padding: const EdgeInsets.all(15),
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Rang.toosi,
            ),
            child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: ()  {
                       _getImage();
                       
                      },
                      
                      child:
                   image!=null?
                  
                       ClipRRect(
                       
                      borderRadius: BorderRadius.circular(40),
                      child: Image.file(image!,width: 100,height:110,fit: BoxFit.fill,),)
                    :
                      const Icon(CupertinoIcons.profile_circled,size: 110,color: Rang.grey,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyStorage.box.read(StorageNames.fullName) ??'--',
                        style: textStyle.bodySmall,
                      ),
                        
                          (Dim.large/2).height,
                      Text(
                        MyStorage.box.read(StorageNames.number) ?? '--',
                        style: textStyle.bodySmall,
                      ),  
                        (Dim.large/2).height,
                      Text(
                        MyStorage.box.read(StorageNames.email) ?? '--',
                        style: textStyle.bodySmall,
                      ),
                    ],
                  ),
                 ( Dim.xlarge+6).width,
            
                ],
              ),
          
          );
  }}