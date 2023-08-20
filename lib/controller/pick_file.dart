



import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PickFileController extends GetxController{


  Rx<PlatformFile> file=PlatformFile(name:'not',size:0).obs;
}


PickFileController pickFileController=Get.put(PickFileController());


Future getFile()async{
var box=GetStorage();
FilePickerResult? result=await FilePicker.platform.pickFiles(type:FileType.image) ;
pickFileController.file.value=result!.files.first;
box.write('ima', pickFileController.file.value.path);
}
