import 'dart:developer';

import 'package:dio/dio.dart';

class DioService{
Dio dio=Dio();
Future<dynamic> getList(String url)  async{



dio.options.headers['Content-Type']='application/json';
return await dio.get(url,options: Options(
  responseType: ResponseType.json,method:'Get'
)).then((value){
  log(value.toString());
  return value;
});




}




}
