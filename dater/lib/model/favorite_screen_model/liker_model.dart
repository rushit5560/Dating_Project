/*import 'dart:convert';

LikerModel likerModelFromJson(String str) => LikerModel.fromJson(json.decode(str));

String likerModelToJson(LikerModel data) => json.encode(data.toJson());

class LikerModel {
  LikerModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<LikerData> msg;
  String token;
  int statusCode;

  factory LikerModel.fromJson(Map<String, dynamic> json) => LikerModel(
    response: json["response"] ?? "",
    msg: List<LikerData>.from((json["msg"] ?? []).map((x) => LikerData.fromJson(x ?? {}))),
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

class LikerData {
  LikerData({
    required this.id,
    required this.name,
    required this.genderGet,
    required this.yearOfBirth,
    required this.latitude,
    required this.longitude,
    required this.profilePrompts,
    required this.bio,
    required this.work,
    required this.education,
    required this.uniid,
    required this.images,
    required this.distance,
  });

  String id;
  String name;
  String genderGet;
  String yearOfBirth;
  String latitude;
  String longitude;
  String profilePrompts;
  String bio;
  String work;
  String education;
  String uniid;
  List<LikerImage> images;
  String distance;

  factory LikerData.fromJson(Map<String, dynamic> json) => LikerData(
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
    images: List<LikerImage>.from((json["images"] ?? []).map((x) => LikerImage.fromJson(x ?? {}))),
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
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "distance": distance,
  };
}

class LikerImage {
  LikerImage({
    required this.imageUrl,
  });

  String imageUrl;

  factory LikerImage.fromJson(Map<String, dynamic> json) => LikerImage(
    imageUrl: json["image_url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
  };
}*/


import 'dart:convert';

LikerModel likerModelFromJson(String str) => LikerModel.fromJson(json.decode(str));

String likerModelToJson(LikerModel data) => json.encode(data.toJson());

class LikerModel {
  LikerModel({
    required this.response,
    required this.msg,
    required this.token,
    required this.statusCode,
  });

  String response;
  List<LikerData> msg;
  String token;
  int statusCode;

  factory LikerModel.fromJson(Map<String, dynamic> json) => LikerModel(
    response: json["response"] ?? "",
    msg: List<LikerData>.from((json["msg"] ?? []).map((x) => LikerData.fromJson(x ?? {}))),
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

class LikerData {
  LikerData({
    required this.id,
    required this.name,
    required this.genderGet,
    required this.yearOfBirth,
    required this.profilePrompts,
    required this.bio,
    required this.work,
    required this.education,
    // required this.updatedAt,
    required this.verified,
    required this.genderGetId,
    required this.images,
    required this.distance,
    required this.age,
    required this.activeTime,
    required this.interest,
  });

  String id;
  String name;
  String genderGet;
  String yearOfBirth;
  String profilePrompts;
  String bio;
  String work;
  String education;
  // DateTime updatedAt;
  String verified;
  String genderGetId;
  List<LikerImage> images;
  String distance;
  String age;
  String activeTime;
  List<Interest> interest;

  factory LikerData.fromJson(Map<String, dynamic> json) => LikerData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    genderGet: json["gender_get"] ?? "",
    yearOfBirth: json["year_of_birth"] ?? "",
    profilePrompts: json["profile_prompts"] ?? "",
    bio: json["bio"] ?? "",
    work: json["work"] ?? "",
    education: json["education"] ?? "",
    // updatedAt: DateTime.parse(json["updated_at"]),
    verified: json["verified"] ?? "",
    genderGetId: json["gender_get_id"] ?? "",
    images: List<LikerImage>.from((json["images"] ?? []).map((x) => x ?? {})),
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
    "images": List<dynamic>.from(images.map((x) => x)),
    "distance": distance,
    "age": age,
    "active_time": activeTime,
    "interest": List<dynamic>.from(interest.map((x) => x.toJson())),
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

class LikerImage {
  LikerImage({
    required this.imageUrl,
  });

  String imageUrl;

  factory LikerImage.fromJson(Map<String, dynamic> json) => LikerImage(
    imageUrl: json["image_url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
  };
}