class Product {
  String s0;
  String s1;
  String s2;
  String s3;
  String s4;
  String s5;
  String s6;
  String s7;
  String s8;
  String s9;
  String s10;
  String s11;
  String s12;
  String s13;
  String s14;
  String s15;
  String s16;
  String id;
  String categoryId;
  String userId;
  String name;
  String city;
  String status;
  String offer;
  String mark;
  String price;
  String useDate;
  String details;
  String contactPhone;
  String checked;
  String ask;
  String createdAt;
  String updatedAt;
  String image;

  Product(
      {this.s0,
      this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      this.s10,
      this.s11,
      this.s12,
      this.s13,
      this.s14,
      this.s15,
      this.s16,
      this.id,
      this.categoryId,
      this.userId,
      this.name,
      this.city,
      this.status,
      this.offer,
      this.mark,
      this.price,
      this.useDate,
      this.details,
      this.contactPhone,
      this.checked,
      this.ask,
      this.createdAt,
      this.updatedAt,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    id = json['id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    name = json['name'];
    city = json['city'];
    status = json['status'];
    offer = json['offer'];
    mark = json['mark'];
    price = json['price'];
    useDate = json['use_date'];
    details = json['details'];
    contactPhone = json['contact_phone'];
    checked = json['checked'];
    ask = json['ask'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['city'] = this.city;
    data['status'] = this.status;
    data['offer'] = this.offer;
    data['mark'] = this.mark;
    data['price'] = this.price;
    data['use_date'] = this.useDate;
    data['details'] = this.details;
    data['contact_phone'] = this.contactPhone;
    data['checked'] = this.checked;
    data['ask'] = this.ask;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}