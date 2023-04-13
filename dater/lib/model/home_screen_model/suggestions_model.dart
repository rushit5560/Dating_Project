/*
import 'dart:convert';

SuggestionListModel suggestionListModelFromJson(String str) => SuggestionListModel.fromJson(json.decode(str));

String suggestionListModelToJson(SuggestionListModel data) => json.encode(data.toJson());

class SuggestionListModel {
  SuggestionListModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  String response;
  List<SuggestionData> msg;
  int statusCode;

  factory SuggestionListModel.fromJson(Map<String, dynamic> json) => SuggestionListModel(
    response: json["response"] ?? "",
    msg: List<SuggestionData>.from((json["msg"] ?? []).map((x) => SuggestionData.fromJson(x ?? {}))),
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
    "status_code": statusCode,
  };
}

class SuggestionData {
  SuggestionData({
    this.id,
    this.name,
    this.sexualityGet,
    this.targetGenderGet,
    this.profilePrompts,
    this.bio,
    this.homeTown,
    this.languages,
    this.verified,
    this.distance,
    this.age,
    this.activeTime,
    this.interest,
    this.basic,
  });

  String? id;
  String? name;
  String? sexualityGet;
  String? targetGenderGet;
  String? profilePrompts;
  String? bio;
  String? homeTown;
  String? languages;
  String? verified;
  String? distance;
  String? age;
  String? activeTime;
  List<Interest>? interest;
  Basic? basic;

  factory SuggestionData.fromJson(Map<String, dynamic> json) => SuggestionData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    sexualityGet: json["sexuality_get"] ?? "",
    targetGenderGet: json["target_gender_get"] ?? "",
    profilePrompts: json["profile_prompts"] ?? "",
    bio: json["bio"] ?? "",
    homeTown: json["home_town"] ?? "",
    languages: json["languages"] ?? "",
    verified: json["verified"] ?? "",
    distance: json["distance"] ?? "",
    age: json["age"] ?? "",
    activeTime: json["active_time"] ?? "",
    interest: List<Interest>.from((json["interest"] ?? []).map((x) => x ?? {})),
    basic: Basic.fromJson(json["basic"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sexuality_get": sexualityGet,
    "target_gender_get": targetGenderGet,
    "profile_prompts": profilePrompts,
    "bio": bio,
    "home_town": homeTown,
    "languages": languages,
    "verified": verified,
    "distance": distance,
    "age": age,
    "active_time": activeTime,
    "interest": List<dynamic>.from(interest!.map((x) => x)),
    "basic": basic!.toJson(),
  };
}


class Basic {
  Basic({
    required this.gender,
    required this.work,
    required this.education,
    required this.height,
    required this.exercise,
    required this.smoking,
    required this.drinking,
    required this.politics,
    required this.religion,
    required this.kids,
  });

  String gender;
  String work;
  String education;
  String height;
  String exercise;
  String smoking;
  String drinking;
  String politics;
  String religion;
  String kids;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
    gender: json["gender"] ?? "",
    work: json["work"] ?? "",
    education: json["education"] ?? "",
    height: json["height"] ?? "",
    exercise: json["exercise"] ?? "",
    smoking: json["smoking"] ?? "",
    drinking: json["drinking"] ?? "",
    politics: json["politics"] ?? "",
    religion: json["religion"] ?? "",
    kids: json["kids"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "work": work,
    "education": education,
    "height": height,
    "exercise": exercise,
    "smoking": smoking,
    "drinking": drinking,
    "politics": politics,
    "religion": religion,
    "kids": kids,
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
*/

import 'dart:convert';

SuggestionListModel suggestionListModelFromJson(String str) =>
    SuggestionListModel.fromJson(json.decode(str));

String suggestionListModelToJson(SuggestionListModel data) =>
    json.encode(data.toJson());

class SuggestionListModel {
  SuggestionListModel({
    required this.response,
    required this.msg,
    required this.statusCode,
  });

  String response;
  List<SuggestionData> msg;
  int statusCode;

  factory SuggestionListModel.fromJson(Map<String, dynamic> json) =>
      SuggestionListModel(
        response: json["response"] ?? "",
        msg: List<SuggestionData>.from(
            (json["msg"] ?? []).map((x) => SuggestionData.fromJson(x ?? {}))),
        statusCode: json["status_code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class SuggestionData {
  SuggestionData({
    this.id,
    this.name,
    this.sexualityGet,
    this.targetGenderGet,
    this.profilePrompts,
    this.bio,
    this.homeTown,
    this.languages,
    this.verified,
    this.distance,
    this.age,
    this.activeTime,
    this.interest,
    this.basic,
  });

  String? id;
  String? name;
  String? sexualityGet;
  String? targetGenderGet;
  String? profilePrompts;
  String? bio;
  String? homeTown;
  String? languages;
  String? verified;
  String? distance;
  String? age;
  String? activeTime;
  List<Interest>? interest;
  Basic? basic;

  factory SuggestionData.fromJson(Map<String, dynamic> json) => SuggestionData(
        id: json["id"] ?? "",
        name: json["name"] ?? "Eliza Willams",
        sexualityGet: json["sexuality_get"] ?? "",
        targetGenderGet: json["target_gender_get"] ?? "",
        profilePrompts:
            json["profile_prompts"] ?? "Life is simple Don't overthink it",
        bio: json["bio"] ?? "",
        homeTown: json["home_town"] ?? "",
        languages: json["languages"] ?? "",
        verified: json["verified"] ?? "",
        distance: json["distance"] ?? "Your location not found",
        age: json["age"].toString().toLowerCase() ==
                    "Age is not available".toLowerCase() ||
                json["age"] == null
            ? ""
            : json["age"],
        activeTime: json["active_time"] ?? "",
        interest:
            List<Interest>.from((json["interest"] ?? []).map((x) => x ?? {})),
        basic: Basic.fromJson(json["basic"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sexuality_get": sexualityGet,
        "target_gender_get": targetGenderGet,
        "profile_prompts": profilePrompts,
        "bio": bio,
        "home_town": homeTown,
        "languages": languages,
        "verified": verified,
        "distance": distance,
        "age": age,
        "active_time": activeTime,
        "interest": List<Interest>.from(interest!.map((x) => x)),
        "basic": basic!.toJson(),
      };
}

class Basic {
  Basic({
    required this.gender,
    required this.work,
    required this.education,
    required this.height,
    required this.exercise,
    required this.smoking,
    required this.drinking,
    required this.politics,
    required this.religion,
    required this.kids,
  });

  String gender;
  String work;
  String education;
  String height;
  String exercise;
  String smoking;
  String drinking;
  String politics;
  String religion;
  String kids;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        gender: json["gender"] ?? "",
        work: json["work"] ?? "",
        education: json["education"] ?? "",
        height: json["height"] ?? "",
        exercise: json["exercise"] ?? "",
        smoking: json["smoking"] ?? "",
        drinking: json["drinking"] ?? "",
        politics: json["politics"] ?? "",
        religion: json["religion"] ?? "",
        kids: json["kids"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "work": work,
        "education": education,
        "height": height,
        "exercise": exercise,
        "smoking": smoking,
        "drinking": drinking,
        "politics": politics,
        "religion": religion,
        "kids": kids,
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
