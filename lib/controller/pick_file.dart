



import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../view/profile/personal_info.dart';

class PickFileController extends GetxController{


  Rx<PlatformFile> file=PlatformFile(name:'not',size:0).obs;
}


PickFileController pickFileController=Get.put(PickFileController());


Future getFile()async{

FilePickerResult? result=await FilePicker.platform.pickFiles(type:FileType.image) ;
pickFileController.file.value=result!.files.first;
Personal().box.write('ima', pickFileController.file.value.path);
}
