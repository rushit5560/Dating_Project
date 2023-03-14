// To parse this JSON data, do
//
//     final saveIntrestModel = saveIntrestModelFromJson(jsonString);

import 'dart:convert';

SaveIntrestModel saveIntrestModelFromJson(String str) =>
    SaveIntrestModel.fromJson(json.decode(str));

// String saveIntrestModelToJson(SaveIntrestModel data) =>
//     json.encode(data.toJson());

class SaveIntrestModel {
  SaveIntrestModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  final String response;
  final String msg;
  final String token;
  final int statusCode;

  factory SaveIntrestModel.fromJson(Map<String, dynamic> json) =>
      SaveIntrestModel(
        response: json["response"] ?? "",
        msg: json["msg"] ?? "",
        token: json["token"] ?? "",
        statusCode: json["status_code"] ?? 0,
      );

  // Map<String, dynamic> toJson() => {
  //       "response": response,
  //       "msg": msg,
  //       "token": token,
  //       "status_code": statusCode,
  //     };
}
