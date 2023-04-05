import 'dart:convert';

UpdateLocationModel updateLocationModelFromJson(String str) => UpdateLocationModel.fromJson(json.decode(str));

String updateLocationModelToJson(UpdateLocationModel data) => json.encode(data.toJson());

class UpdateLocationModel {
  UpdateLocationModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  String msg;
  String token;
  int statusCode;

  factory UpdateLocationModel.fromJson(Map<String, dynamic> json) => UpdateLocationModel(
    response: json["response"] ?? "",
    msg: json["msg"] ?? "",
    token: json["token"] ?? "",
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": msg,
    "token": token,
    "status_code": statusCode,
  };
}



/// New model

UserAgeModel userAgeModelFromJson(String str) => UserAgeModel.fromJson(json.decode(str));

String userAgeModelToJson(UserAgeModel data) => json.encode(data.toJson());

class UserAgeModel {
  UserAgeModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  String response;
  String msg;
  int statusCode;

  factory UserAgeModel.fromJson(Map<String, dynamic> json) => UserAgeModel(
    response: json["response"] ?? "",
    msg: json["msg"] ?? "",
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": msg,
    "status_code": statusCode,
  };
}

/// New model

MessageSendModel messageSendModelFromJson(String str) => MessageSendModel.fromJson(json.decode(str));

String messageSendModelToJson(MessageSendModel data) => json.encode(data.toJson());

class MessageSendModel {
  MessageSendModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  String response;
  String msg;
  int statusCode;

  factory MessageSendModel.fromJson(Map<String, dynamic> json) => MessageSendModel(
    response: json["response"] ?? "",
    msg: json["msg"] ?? "",
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": msg,
    "status_code": statusCode,
  };
}
