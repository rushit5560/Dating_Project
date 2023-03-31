/*
import 'dart:convert';

MatchesModel matchesModelFromJson(String str) => MatchesModel.fromJson(json.decode(str));

String matchesModelToJson(MatchesModel data) => json.encode(data.toJson());

class MatchesModel {
  MatchesModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<MatchPersonData> msg;
  String token;
  int statusCode;

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
    response: json["response"] ?? "",
    msg: List<MatchPersonData>.from((json["msg"] ?? []).map((x) => MatchPersonData.fromJson(x ?? {}))),
    token: json["token"] ?? "",
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
    "token": token,
    "status_code": statusCode,
  };
}

class MatchPersonData {
  MatchPersonData({
    required this.id,
    required this.name,
    required this.yearOfBirth,
  });

  String id;
  String name;
  String yearOfBirth;

  factory MatchPersonData.fromJson(Map<String, dynamic> json) => MatchPersonData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    yearOfBirth: json["year_of_birth"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year_of_birth": yearOfBirth,
  };
}
*/


import 'dart:convert';

MatchesModel matchesModelFromJson(String str) => MatchesModel.fromJson(json.decode(str));

String matchesModelToJson(MatchesModel data) => json.encode(data.toJson());

class MatchesModel {
  MatchesModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<MatchPersonData> msg;
  String token;
  int statusCode;

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
    response: json["response"] ?? "",
    msg: List<MatchPersonData>.from((json["msg"] ?? []).map((x) => MatchPersonData.fromJson(x ?? {}))),
    token: json["token"] ?? "",
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
    "token": token,
    "status_code": statusCode,
  };
}

class MatchPersonData {
  MatchPersonData({
    this.id,
    this.name,
    this.genderGet,
    this.yearOfBirth,
    this.latitude,
    this.longitude,
    this.profilePrompts,
    this.bio,
    this.work,
    this.education,
    this.uniid,
    this.genderGetId,
    this.distance,
  });

  String? id;
  String? name;
  String? genderGet;
  String? yearOfBirth;
  String? latitude;
  String? longitude;
  String? profilePrompts;
  String? bio;
  String? work;
  String? education;
  String? uniid;
  String? genderGetId;
  String? distance;

  factory MatchPersonData.fromJson(Map<String, dynamic> json) => MatchPersonData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    genderGet: json["gender_get"] ?? "",
    yearOfBirth: json["year_of_birth"] ?? "",
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    profilePrompts: json["profile_prompts"] ?? "",
    bio: json["bio"] ?? "",
    work: json["work"] ?? "",
    education: json["education"] ?? "",
    uniid: json["uniid"] ?? "",
    genderGetId: json["gender_get_id"] ?? "",
    distance: json["distance"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender_get": genderGet,
    "year_of_birth": yearOfBirth,
    "latitude": latitude,
    "longitude": longitude,
    "profile_prompts": profilePrompts,
    "bio": bio,
    "work": work,
    "education": education,
    "uniid": uniid,
    "gender_get_id": genderGetId,
    "distance": distance,
  };
}
