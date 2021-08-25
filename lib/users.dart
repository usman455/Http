import 'dart:convert';
Post postFromJson(String str) => Post.fromJson(json.decode(str));
String postToJson(Post data) => json.encode(data.toJson());
class Post {
  Post({
    this.code,
    this.message,
    this.data,
  });
  int code;
  String message;
  List<DataModal> data;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    code: json["code"],
    message: json["message"],
    data: List<DataModal>.from(json["data"].map((x) => DataModal.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataModal {
  DataModal({
    this.id,
    this.name,
    this.code,
  });
  int id;
  String name;
  String code;
  factory DataModal.fromJson(Map<String, dynamic> json) => DataModal(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}
