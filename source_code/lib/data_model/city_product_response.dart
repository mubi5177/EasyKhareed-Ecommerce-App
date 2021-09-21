

import 'dart:convert';

CityProductResponse cityproductResponseFromJson(String str) => CityProductResponse.fromJson(json.decode(str));

String cityproductResponseToJson(CityProductResponse id) => json.encode(id.toJson());

class CityProductResponse {
  CityProductResponse({
    this.id,
    this.name,
    this.image,
  });

  List<CityProduct> id;
  String name;
  String image;

  factory CityProductResponse.fromJson(Map<String, dynamic> json) => CityProductResponse(
    id: List<CityProduct>.from(json["id"].map((x) => CityProduct.fromJson(x))),
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": List<dynamic>.from(id.map((x) => x.toJson())),
    "name": name,
    "image": image,
  };
}

class CityProduct {
  CityProduct({
    this.id,
    this.name,
    this.image,
  });

  @override toString() => '$image';

  int id;
  int name;
  String image;

  factory CityProduct.fromJson(Map<String, dynamic> json) => CityProduct(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
