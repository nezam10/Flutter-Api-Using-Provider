import 'dart:convert';

class DataModel {
  DataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  var userId;
  var id;
  var title;
  var body;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        userId: json["userId"] ?? "",
        id: json["id"],
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

List<DataModel> userModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));
