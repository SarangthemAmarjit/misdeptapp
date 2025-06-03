import 'dart:convert';

List<NotificationModel> NotificationModelFromJson(String str) =>
    List<NotificationModel>.from(
      json.decode(str).map((x) => NotificationModel.fromJson(x)),
    );

String NotificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  int id;
  String filePath;
  String title;
  DateTime date;

  NotificationModel({
    required this.id,
    required this.filePath,
    required this.title,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["Id"],
        filePath: json["FilePath"],
        title: json["Title"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "FilePath": filePath,
    "Title": title,
    "Date": date.toIso8601String(),
  };
}
