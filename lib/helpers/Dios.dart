import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:soug/model/Imageslider.dart';
import 'package:soug/model/Product.dart';

class Dios{
  Future<List<Imageslider>> getImageSlider() async{
    
    try {
    Response response = await Dio().get("http://muhana9.com/markapp/app/show/banner.php");
    List responseJson = json.decode(response.data);
   return responseJson.map((m) => new Imageslider.fromJson(m)).toList();
    //data.forEach((element) => print(element.image));
    //print(response);
  } catch (e) {
    print(e);
    return null;
  }
  }
  Future<List<Product>> getProducts() async{
    try{
      Response response = await Dio().get("http://muhana9.com/markapp/app/show/products.php?x=y&status=جديد");
      List responeJson = json.decode(response.data);
      return responeJson.map((m)=> new Product.fromJson(m)).toList();
    }catch(e){
      print(e);
      return null;
    }
  }
  void getHttp() async {
  // try {
  //   Response response = await Dio().get("http://muhana9.com/markapp/app/show/banner.php");
  //   List responseJson = json.decode(response.data);
  //   //var data = responseJson.map((m) => new Imageslider.fromJson(m)).toList();
  //   data.forEach((element) => print(element.image));
  //   //print(response);
  // } catch (e) {
  //   print(e);
  // }
}
}