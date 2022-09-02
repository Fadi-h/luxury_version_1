import 'dart:convert';

class CarInfo {
  CarInfo({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  CarData? data;

  factory CarInfo.fromJson(String str) => CarInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInfo.fromMap(Map<String, dynamic> json) => CarInfo(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : CarData.fromMap(json['data']),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    // "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };

}

class CarData {
  CarData({
    required this.car,
  });

  CarDetail? car;

  factory CarData.fromJson(String str) => CarData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarData.fromMap(Map<String, dynamic> json) =>  CarData(
    car: json["car"] == null ? null : CarDetail.fromJson(json["car"]),
  );

  Map<String, dynamic> toMap() => {
    "car": car == null ? null : car!.toJson(),
  };

}

class CarDetail {
  CarDetail({
    required this.id,
    required this.typeId,
    required this.brandId,
    required this.bodyId,
    required this.slug,
    required this.slugGroup,
    required this.model,
    required this.year,
    required this.innerColor,
    required this.outerColor,
    required this.seats,
    required this.oldDailyPrice,
    required this.dailyPrice,
    required this.oldHourlyPrice,
    required this.hourlyPrice,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.imgs,
    required this.metaTitleEn,
    required this.metaTitleAr,
    required this.metaKeywordsEn,
    required this.metaKeywordsAr,
    required this.metaDescriptionEn,
    required this.metaDescriptionAr,
    required this.metaImage,
    // required this.updatedAt,
    required this.brands,
    required this.bodies,
  });

  int id;
  int typeId;
  int brandId;
  int bodyId;
  String slug;
  String slugGroup;
  String model;
  int year;
  String innerColor;
  String outerColor;
  int seats;
  int oldDailyPrice;
  int dailyPrice;
  int oldHourlyPrice;
  int hourlyPrice;
  dynamic descriptionEn;
  dynamic descriptionAr;
  String imgs;
  String metaTitleEn;
  String metaTitleAr;
  String metaKeywordsEn;
  String metaKeywordsAr;
  String metaDescriptionEn;
  dynamic metaDescriptionAr;
  String metaImage;
  // DateTime updatedAt;
  Brands? brands;
  Bodies? bodies;

  factory CarDetail.fromJson(Map<String, dynamic> json) => CarDetail(
    id: json["id"] == null ? -1 : json["id"],
    typeId: json["type_id"] == null ? -1 : json["type_id"],
    brandId: json["brand_id"] == null ? -1 : json["brand_id"],
    bodyId: json["body_id"] == null ? -1 : json["body_id"],
    slug: json["slug"] == null ? "null" : json["slug"],
    slugGroup: json["slug_group"] == null ? "null" : json["slug_group"],
    model: json["model"] == null ? "null" : json["model"],
    year: json["year"] == null ? -1 : json["year"],
    innerColor: json["inner_color"] == null ? "null" : json["inner_color"],
    outerColor: json["outer_color"] == null ? "null" : json["outer_color"],
    seats: json["seats"] == null ? -1 : json["seats"],
    oldDailyPrice: json["old_daily_price"] == null ? -1 : json["old_daily_price"],
    dailyPrice: json["daily_price"] == null ? -1 : json["daily_price"],
    oldHourlyPrice: json["old_hourly_price"] == null ? -1 : json["old_hourly_price"],
    hourlyPrice: json["hourly_price"] == null ? -1 : json["hourly_price"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    imgs: json["imgs"] == null ? "null" : json["imgs"],
    metaTitleEn: json["meta_title_en"] == null ? "null" : json["meta_title_en"],
    metaTitleAr: json["meta_title_ar"] == null ? "null" : json["meta_title_ar"],
    metaKeywordsEn: json["meta_keywords_en"] == null ? "null" : json["meta_keywords_en"],
    metaKeywordsAr: json["meta_keywords_ar"] == null ? "null" : json["meta_keywords_ar"],
    metaDescriptionEn: json["meta_description_en"] == null ? "null" : json["meta_description_en"],
    metaDescriptionAr: json["meta_description_ar"] == null ? null : json["meta_description_ar"],
    metaImage: json["meta_image"] == null ? "null" : json["meta_image"],
    // updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
    bodies: json["bodies"] == null ? null : Bodies.fromJson(json["bodies"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "type_id": typeId == null ? null : typeId,
    "brand_id": brandId == null ? null : brandId,
    "body_id": bodyId == null ? null : bodyId,
    "slug": slug == null ? null : slug,
    "slug_group": slugGroup == null ? null : slugGroup,
    "model": model == null ? null : model,
    "year": year == null ? null : year,
    "inner_color": innerColor == null ? null : innerColor,
    "outer_color": outerColor == null ? null : outerColor,
    "seats": seats == null ? null : seats,
    "old_daily_price": oldDailyPrice == null ? null : oldDailyPrice,
    "daily_price": dailyPrice == null ? null : dailyPrice,
    "old_hourly_price": oldHourlyPrice == null ? null : oldHourlyPrice,
    "hourly_price": hourlyPrice == null ? null : hourlyPrice,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "imgs": imgs == null ? null : imgs,
    "meta_title_en": metaTitleEn == null ? null : metaTitleEn,
    "meta_title_ar": metaTitleAr == null ? null : metaTitleAr,
    "meta_keywords_en": metaKeywordsEn == null ? null : metaKeywordsEn,
    "meta_keywords_ar": metaKeywordsAr == null ? null : metaKeywordsAr,
    "meta_description_en": metaDescriptionEn == null ? null : metaDescriptionEn,
    "meta_description_ar": metaDescriptionAr,
    "meta_image": metaImage == null ? null : metaImage,
    // "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "brands": brands == null ? null : brands!.toJson(),
    "bodies": bodies == null ? null : bodies!.toJson(),
  };
}

class Bodies {
  Bodies({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.img,
    required this.updatedAt,
  });

  int id;
  String nameEn;
  String nameAr;
  String img;
  dynamic updatedAt;

  factory Bodies.fromJson(Map<String, dynamic> json) => Bodies(
    id: json["id"] == null ? null : json["id"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    img: json["img"] == null ? null : json["img"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name_en": nameEn == null ? null : nameEn,
    "name_ar": nameAr == null ? null : nameAr,
    "img": img == null ? null : img,
    "updated_at": updatedAt,
  };
}

class Brands {
  Brands({
    required this.id,
    required this.name,
    required this.titleEn,
    required this.titleAr,
    required this.img,
    required this.cover,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.slug,
    required this.orderNum,
    required this.metaTitleEn,
    required this.metaTitleAr,
    required this.metaKeywordsEn,
    required this.metaKeywordsAr,
    required this.metaDescriptionEn,
    required this.metaDescriptionAr,
    required this.metaImage,
    // required this.updatedAt,
  });

  int id;
  String name;
  String titleEn;
  String titleAr;
  String img;
  String cover;
  String descriptionEn;
  dynamic descriptionAr;
  String slug;
  int orderNum;
  String metaTitleEn;
  String metaTitleAr;
  String metaKeywordsEn;
  String metaKeywordsAr;
  String metaDescriptionEn;
  dynamic metaDescriptionAr;
  String metaImage;
  // DateTime updatedAt;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    titleEn: json["title_en"] == null ? null : json["title_en"],
    titleAr: json["title_ar"] == null ? null : json["title_ar"],
    img: json["img"] == null ? null : json["img"],
    cover: json["cover"] == null ? null : json["cover"],
    descriptionEn: json["description_en"] == null ? null : json["description_en"],
    descriptionAr: json["description_ar"],
    slug: json["slug"] == null ? null : json["slug"],
    orderNum: json["order_num"] == null ? null : json["order_num"],
    metaTitleEn: json["meta_title_en"] == null ? null : json["meta_title_en"],
    metaTitleAr: json["meta_title_ar"] == null ? null : json["meta_title_ar"],
    metaKeywordsEn: json["meta_keywords_en"] == null ? null : json["meta_keywords_en"],
    metaKeywordsAr: json["meta_keywords_ar"] == null ? null : json["meta_keywords_ar"],
    metaDescriptionEn: json["meta_description_en"] == null ? null : json["meta_description_en"],
    metaDescriptionAr: json["meta_description_ar"],
    metaImage: json["meta_image"] == null ? null : json["meta_image"],
    // updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "title_en": titleEn == null ? null : titleEn,
    "title_ar": titleAr == null ? null : titleAr,
    "img": img == null ? null : img,
    "cover": cover == null ? null : cover,
    "description_en": descriptionEn == null ? null : descriptionEn,
    "description_ar": descriptionAr,
    "slug": slug == null ? null : slug,
    "order_num": orderNum == null ? null : orderNum,
    "meta_title_en": metaTitleEn == null ? null : metaTitleEn,
    "meta_title_ar": metaTitleAr == null ? null : metaTitleAr,
    "meta_keywords_en": metaKeywordsEn == null ? null : metaKeywordsEn,
    "meta_keywords_ar": metaKeywordsAr == null ? null : metaKeywordsAr,
    "meta_description_en": metaDescriptionEn == null ? null : metaDescriptionEn,
    "meta_description_ar": metaDescriptionAr,
    "meta_image": metaImage == null ? null : metaImage,
    // "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
