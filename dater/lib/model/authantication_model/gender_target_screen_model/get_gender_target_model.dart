

import 'dart:convert';

GetTargetenderModel getTargetenderModelFromJson(String str) =>
    GetTargetenderModel.fromJson(json.decode(str));

String getTargetenderModelToJson(GetTargetenderModel data) =>
    json.encode(data.toJson());

class GetTargetenderModel {
  GetTargetenderModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  final String response;
  final List<Msg> msg;
  final int statusCode;

  factory GetTargetenderModel.fromJson(Map<String, dynamic> json) =>
      GetTargetenderModel(
        response: json["response"] ?? "",
        msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x)) ?? []),
        statusCode: json["status_code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        // "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class Msg {
  Msg({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  // };
}
