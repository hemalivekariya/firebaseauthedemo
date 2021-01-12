// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.age,
    this.characteristics,
    this.email,
    this.languages,
    this.name,
    this.uid,
    this.address,
  });

  int age;
  List<String> characteristics;
  String email;
  List<String> languages;
  String name;
  String uid;
  Address address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    age: json["age"],
    characteristics: List<String>.from(json["characteristics"]?.map((x) => x) ?? []),
    email: json["email"],
    languages: List<String>.from(json["languages"]?.map((x) => x) ?? []),
    name: json["name"],
    uid: json["uid"],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "characteristics": List<dynamic>.from(characteristics?.map((x) => x)),
    "email": email,
    "languages": List<dynamic>.from(languages?.map((x) => x)),
    "name": name,
    "uid": uid,
    "address": address.toJson(),
  };
}

class Address {
  Address({
    this.city,
    this.street,
  });

  String city;
  String street;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
  };
}
