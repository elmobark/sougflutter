
import 'package:flutter/widgets.dart';
import 'package:soug/colors.dart';
import 'package:soug/model/Product.dart';

class MiniWidgets{
  Row cardDetils(List<Product> list,int postion){
    return Row(children: <Widget>[
      
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text("الماركة",style: TextStyle(color: BlueTextColor,fontSize: 20,fontWeight: FontWeight.bold),)
          ,Text(list[postion].mark)
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text("المدينة",style: TextStyle(color: BlueTextColor,fontSize: 20,fontWeight: FontWeight.bold))
          ,Text(list[postion].city)
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text("الحاله",style: TextStyle(color: BlueTextColor,fontSize: 20,fontWeight: FontWeight.bold)),
          Text(list[postion].status)
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text("العرض",style: TextStyle(color: BlueTextColor,fontSize: 20,fontWeight: FontWeight.bold)),
          Text(list[postion].offer)
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text("السعر",style: TextStyle(color: BlueTextColor,fontSize: 20,fontWeight: FontWeight.bold)),
          Text(list[postion].price)
        ],),
      ),
     
      
      
      
    ],);
  }
}