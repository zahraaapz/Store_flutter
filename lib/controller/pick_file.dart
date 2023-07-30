



import 'package:get/get.dart';

class PickFileController extends GetxController{


  Rx<PlatformFile> file=PlatformFile(name:'not',size:0).obs;
}
PickFileController pickFileController=Get.put(PickFileController());
Future getFile()async{



  FilePickerResult? result=await FilePicker.platform.PickFiles(Type:FilePick.image) ;
pickFileController.file.value=result!.files.first;

}