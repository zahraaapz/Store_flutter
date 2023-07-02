import 'dart:developer';

import 'package:dio/dio.dart';

class DioService{

Future<dynamic> getList(String url)async{

Dio dio=Dio();

dio.options.headers['Content-Type']='application/json';
return await dio.get(url,options: Options(
  responseType: ResponseType.json,method:'Get'
)).then((value){
  log(value.toString());
  return value;
});




}
}
