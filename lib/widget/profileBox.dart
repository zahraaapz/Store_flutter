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
const ProfileBox({super.key,this.height,this.width});
final height;
final width;
  @override
  State<ProfileBox> createState() => _ProfileBoxState();

  
}

class _ProfileBoxState extends State<ProfileBox> {

String ?appDocPath;
File? _image;



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

final picker=ImagePicker();

final pickedfile=await picker.pickImage(source:ImageSource.gallery);

if(pickedfile==null) return;

_image=File(pickedfile.path);

const name='bg';
final File localImage=await _image!.copy('$appDocPath/$name');

setState(() {
  
});


}



  @override
  Widget build(BuildContext context) {
    
 late Image ima;
   var haslocalImage=File('$appDocPath/bg').existsSync();

   if (haslocalImage) {
     var byte=File('$appDocPath/bg').readAsBytesSync();
 
   
    ima=Image.memory(byte,fit: BoxFit.fill,width: 90,height: 100,);
   }
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
                      File('$appDocPath/bg').existsSync()?
                  
                       ClipRRect(
                       
                      borderRadius: BorderRadius.circular(40),
                      child: ima,)
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