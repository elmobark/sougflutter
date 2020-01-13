import 'package:flutter/widgets.dart';

class Imageslider {
  String image;
  String tag;
  Image widget;
  Imageslider({this.image, this.tag});

  Imageslider.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tag = json['tag'];
    widget = Image.network("http://muhana9.com/markapp/uploads/$image");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['tag'] = this.tag;
    return data;
  }
}