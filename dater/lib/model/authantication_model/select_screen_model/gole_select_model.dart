// To parse this JSON data, do
//
//     final getGoleModel = getGoleModelFromJson(jsonString);

import 'dart:convert';

GoleModel getGoleModelFromJson(String str) =>
    GoleModel.fromJson(json.decode(str));

String getGoleModelToJson(GoleModel data) => json.encode(data.toJson());

class GoleModel {
  GoleModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  final String response;
  final List<GoleData> msg;
  final int statusCode;

  factory GoleModel.fromJson(Map<String, dynamic> json) => GoleModel(
        response: json["response"] ?? "",
        msg: List<GoleData>.from(json["msg"].map((x) => GoleData.fromJson(x)) ?? []),
        statusCode: json["status_code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        // "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class GoleData {
  GoleData({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory GoleData.fromJson(Map<String, dynamic> json) => GoleData(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  // };
}
