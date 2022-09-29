

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.data,
    this.status,
    this.message,
  });

  List<Datum>? data;
  String? status;
  String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Datum {
  Datum({
    this.title,
    this.imagePath,
    this.details,
  });

  String? title;
  String? imagePath;
  String? details;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    imagePath: json["imagePath"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "imagePath": imagePath,
    "details": details,
  };
}
