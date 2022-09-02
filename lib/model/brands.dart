import 'dart:convert';

class Brands {
  Brands({
    required this.code,
    required this.message,
    required this.brand,
  });

  int code;
  String message;
  Brand brand;

  factory Brands.fromJson(String str) => Brands.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brands.fromMap(Map<String, dynamic> json) => Brands(
    code: json["code"] == null ? -1 : json["code"],
    message: json["message"] == null ? "" : json["message"],
    brand: Brand.fromMap(json["brand"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "brand": brand == null ? null : brand.toJson(),
  };
}

class Brand {
  Brand({
    required this.brandInfo,
  });

  List<BrandInfo>? brandInfo;


  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
    brandInfo: json["brand_Info"] == null ? null : List<BrandInfo>.from(json["brand_Info"].map((x) => BrandInfo.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "brand_Info": List<dynamic>.from(brandInfo!.map((x) => x.toJson())),
  };
}

class BrandInfo {
  BrandInfo({
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
  String descriptionAr;
  String slug;
  int orderNum;
  String metaTitleEn;
  String metaTitleAr;
  String metaKeywordsEn;
  String metaKeywordsAr;
  String metaDescriptionEn;
  String metaDescriptionAr;
  String metaImage;
  // DateTime updatedAt;

  factory BrandInfo.fromJson(String str) => BrandInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BrandInfo.fromMap(Map<String, dynamic> json) => BrandInfo(
    id: json["id"] == null ? -1 : json["id"],
    name: json["name"] == null ? "" : json["name"],
    titleEn: json["title_en"] == null ? "" : json["title_en"],
    titleAr: json["title_ar"] == null ? "" : json["title_ar"],
    img: json["img"] == null ? "" : json["img"],
    cover: json["cover"] == null ? "" : json["cover"],
    descriptionEn: json["description_en"] == null ? "" : json["description_en"],
    descriptionAr: json["description_ar"] == null ? "" : json["description_ar"],
    slug: json["slug"] == null ? "" : json["slug"],
    orderNum: json["order_num"] == null ? -1 : json["order_num"],
    metaTitleEn: json["meta_title_en"] == null ? "" : json["meta_title_en"],
    metaTitleAr: json["meta_title_ar"] == null ? "" : json["meta_title_ar"],
    metaKeywordsEn: json["meta_keywords_en"] == null ? "" : json["meta_keywords_en"],
    metaKeywordsAr: json["meta_keywords_ar"] == null ? "" : json["meta_keywords_ar"],
    metaDescriptionEn: json["meta_description_en"] == null ? "" : json["meta_description_en"],
    metaDescriptionAr: json["meta_description_ar"] == null ? "" : json["meta_description_ar"],
    metaImage: json["meta_image"] == null ? "" : json["meta_image"],
    // updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "title_en": titleEn == null ? null : titleEn,
    "title_ar": titleAr == null ? null : titleAr,
    "img": img == null ? null : img,
    "cover": cover == null ? null : cover,
    "description_en": descriptionEn == null ? null : descriptionEn,
    "description_ar": descriptionAr == null ? null : descriptionAr,
    "slug": slug == null ? null : slug,
    "order_num": orderNum == null ? null : orderNum,
    "meta_title_en": metaTitleEn == null ? null : metaTitleEn,
    "meta_title_ar": metaTitleAr == null ? null : metaTitleAr,
    "meta_keywords_en": metaKeywordsEn == null ? null : metaKeywordsEn,
    "meta_keywords_ar": metaKeywordsAr == null ? null : metaKeywordsAr,
    "meta_description_en": metaDescriptionEn == null ? null : metaDescriptionEn,
    "meta_description_ar": metaDescriptionAr == null ? null : metaDescriptionAr,
    "meta_image": metaImage == null ? null : metaImage,
    // "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
