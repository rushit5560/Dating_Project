// To parse this JSON data, do
//
//     final getIntrestModel = getIntrestModelFromJson(jsonString);

import 'dart:convert';

GetIntrestModel getIntrestModelFromJson(String str) =>
    GetIntrestModel.fromJson(json.decode(str));

String getIntrestModelToJson(GetIntrestModel data) =>
    json.encode(data.toJson());

class GetIntrestModel {
  GetIntrestModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  final String response;
  final List<MsgData> msg;
  final int statusCode;

  factory GetIntrestModel.fromJson(Map<String, dynamic> json) =>
      GetIntrestModel(
        response: json["response"] ?? "",
        msg: List<MsgData>.from(
            json["msg"].map((x) => MsgData.fromJson(x)) ?? []),
        statusCode: json["status_code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        // "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class MsgData {
  MsgData({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.categoryId,
  });

  final String id;
  final String name;
  final String categoryName;
  final String categoryId;

  factory MsgData.fromJson(Map<String, dynamic> json) => MsgData(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        categoryName: json["category_name"] ?? "",
        categoryId: json["category_id"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "category_name": categoryName,
  //     "category_id": categoryId,
  // };
}
