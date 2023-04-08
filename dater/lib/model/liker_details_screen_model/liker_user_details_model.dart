import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<UserDetails> msg;
  String token;
  int statusCode;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    response: json["response"] ?? "",
    msg: List<UserDetails>.from((json["msg"] ?? []).map((x) => UserDetails.fromJson(x ?? {}))),
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

class UserDetails {
  UserDetails({
    this.id,
    this.name,
    this.genderGet,
    this.yearOfBirth,
    this.profilePrompts,
    this.bio,
    this.work,
    this.education,
    // required this.updatedAt,
    this.verified,
    this.genderGetId,
    this.distance,
    this.age,
    this.activeTime,
    this.interest,
  });

  String? id;
  String? name;
  String? genderGet;
  String? yearOfBirth;
  String? profilePrompts;
  String? bio;
  String? work;
  String? education;
  // DateTime updatedAt;
  String? verified;
  String? genderGetId;
  String? distance;
  String? age;
  String? activeTime;
  List<Interest>? interest;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    genderGet: json["gender_get"] ?? "",
    yearOfBirth: json["year_of_birth"] ?? "",
    profilePrompts: json["profile_prompts"] ?? "",
    bio: json["bio"] ?? "",
    work: json["work"] ?? "",
    education: json["education"],
    // updatedAt: DateTime.parse(json["updated_at"]),
    verified: json["verified"] ?? "",
    genderGetId: json["gender_get_id"] ?? "",
    distance: json["distance"].toString(),
    age: json["age"].toString(),
    activeTime: json["active_time"] ?? "",
    interest: List<Interest>.from((json["interest"] ?? []).map((x) => Interest.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender_get": genderGet,
    "year_of_birth": yearOfBirth,
    "profile_prompts": profilePrompts,
    "bio": bio,
    "work": work,
    "education": education,
    // "updated_at": updatedAt.toIso8601String(),
    "verified": verified,
    "gender_get_id": genderGetId,
    "distance": distance,
    "age": age,
    "active_time": activeTime,
    "interest": List<dynamic>.from(interest!.map((x) => x.toJson())),
  };
}

class Interest {
  Interest({
    required this.name,
  });

  String name;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
