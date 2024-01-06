import 'package:appstore/constant/textEditController.dart';
import 'package:get_storage/get_storage.dart';

 class  MyStorage{


 static var box=GetStorage();
 List auth=[null,''];

 
  bool checkCondition() {
    return box.read(StorageNames.userName)!=''&&
                      box.read(StorageNames.number)!=''&&
                      box.read(StorageNames.password)!=''&&
                      box.read(StorageNames.pin)!=''&&
                      box.read(StorageNames.preNum)!=''&&
                      box.read(StorageNames.email)!=''&&
                      box.read(StorageNames.fullName)!='';
  } 
  
   bool checkAuthCondition() {
    return 
    auth.contains(box.read(StorageNames.userName))&&
    auth.contains(box.read(StorageNames.number))&&
    auth.contains(box.read(StorageNames.password))&&
    auth.contains(box.read(StorageNames.pin))&&
    auth.contains(box.read(StorageNames.preNum))&&
    auth.contains(box.read(StorageNames.email))&&
    auth.contains(box.read(StorageNames.fullName))
    ;
  }

  void saveInfo() {
      box.write(
        StorageNames.preNum,
       MyTextEditingController.preNum.text);
                          box.write(StorageNames.number,
       MyTextEditingController.number.text);
                          box.write(StorageNames.email,
       MyTextEditingController.email.text);
                          box.write(StorageNames.password,
       MyTextEditingController.password.text);
                          box.write(StorageNames.userName,
       MyTextEditingController.userName.text);
                          box.write(StorageNames.fullName,
       MyTextEditingController.fullName.text); 
           box.write(StorageNames.city,
       MyTextEditingController.fullName.text);  
          box.write(StorageNames.street,
       MyTextEditingController.fullName.text); 
          box.write(StorageNames.pin,
       MyTextEditingController.fullName.text);
  }

 }


abstract class StorageNames{


 static String fullName='fullName';
 static String pin='pin';
 static String number='number';
 static String preNum='preNum';
 static String street='Street';
 static String city='city';
 static String email='emaiL';
 static String userName='userName';
 static String password='password';



}

