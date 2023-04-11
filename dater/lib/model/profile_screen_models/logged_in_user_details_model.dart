import 'dart:convert';

LoggedInUserDetailsModel loggedInUserDetailsModelFromJson(String str) => LoggedInUserDetailsModel.fromJson(json.decode(str));

String loggedInUserDetailsModelToJson(LoggedInUserDetailsModel data) => json.encode(data.toJson());

class LoggedInUserDetailsModel {
  LoggedInUserDetailsModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<UserDetails> msg;
  String token;
  int statusCode;

  factory LoggedInUserDetailsModel.fromJson(Map<String, dynamic> json) => LoggedInUserDetailsModel(
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
    required this.id,
    required this.name,
    this.profilePrompts,
    required this.bio,
    required this.verified,
    required this.homeTown,
    required this.images,
    required this.distance,
    required this.age,
    required this.activeTime,
    required this.interest,
    required this.basic,
  });

  String id;
  String name;
  String? profilePrompts;
  String bio;
  String verified;
  String homeTown;
  List<UserImages> images;
  String distance;
  String age;
  String activeTime;
  List<Interest> interest;
  Basic basic;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    profilePrompts: json["profile_prompts"] ?? "",
    bio: json["bio"] ?? "",
    verified: json["verified"] ?? "",
    homeTown: json["home_town"] ?? "",
    images: List<UserImages>.from((json["images"] ?? []).map((x) => UserImages.fromJson(x ?? {}))),
    distance: json["distance"] ?? "",
    age: json["age"].toString(),
    activeTime: json["active_time"] ?? "",
    interest: List<Interest>.from((json["interest"] ?? []).map((x) => Interest.fromJson(x ?? {}))),
    basic: Basic.fromJson(json["basic"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_prompts": profilePrompts,
    "bio": bio,
    "verified": verified,
    "home_town": homeTown,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "distance": distance,
    "age": age,
    "active_time": activeTime,
    "interest": List<dynamic>.from(interest.map((x) => x.toJson())),
    "basic": basic.toJson(),
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

class UserImages {
  UserImages({
    required this.imageUrl,
  });

  String imageUrl;

  factory UserImages.fromJson(Map<String, dynamic> json) => UserImages(
    imageUrl: json["image_url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
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