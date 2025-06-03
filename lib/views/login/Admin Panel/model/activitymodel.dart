import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) =>
    List<ActivityModel>.from(
      json.decode(str).map((x) => ActivityModel.fromJson(x)),
    );

String activityModelToJson(List<ActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  int id;
  String activity;
  String remark;
  DateTime date;

  ActivityModel({
    required this.id,
    required this.activity,
    required this.remark,
    required this.date,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    id: json["Id"],
    activity: json["Activity"],
    remark: json["Remark"],
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Activity": activity,
    "Remark": remark,
    "Date": date.toIso8601String(),
  };
}
