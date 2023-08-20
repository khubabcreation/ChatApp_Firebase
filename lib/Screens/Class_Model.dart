import 'dart:convert';

Class? classFromJson(String str) => Class.fromJson(json.decode(str));

String classToJson(Class? data) => json.encode(data!.toJson());

class Class {
  Class({
    this.fname,
    this.name,
    this.id,
  });

  String? fname;
  String? name;
  String? id;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    fname: json["Fname"],
    name: json["Name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Fname": fname,
    "Name": name,
    "id": id,
  };
}
