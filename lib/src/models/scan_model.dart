import 'dart:convert';

class ScanModel {
  ScanModel({
    required this.id,
    required this.value,
    required this.type,
  }) {
    if (value.contains("http")) {
      type = "http";
    } else {
      type = "geo";
    }
  }

  int id;
  String value;
  String type;

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        value: json["value"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
        "type": type,
      };
}
