import 'dart:convert';

List<GalleryCovermodel> galleryCovermodelFromJson(String str) =>
    List<GalleryCovermodel>.from(
      json.decode(str).map((x) => GalleryCovermodel.fromJson(x)),
    );

String galleryCovermodelToJson(List<GalleryCovermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryCovermodel {
  int id;
  String imageCoverPath;
  String title;
  DateTime date;
  DateTime eventDate;

  GalleryCovermodel({
    required this.id,
    required this.imageCoverPath,
    required this.title,
    required this.date,
    required this.eventDate,
  });

  factory GalleryCovermodel.fromJson(Map<String, dynamic> json) =>
      GalleryCovermodel(
        id: json["Id"],
        imageCoverPath: json["ImageCoverPath"],
        title: json["Title"],
        date: DateTime.parse(json["Date"]),
        eventDate: DateTime.parse(json["EventDate"]),
      );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ImageCoverPath": imageCoverPath,
    "Title": title,
    "Date": date.toIso8601String(),
    "EventDate": eventDate.toIso8601String(),
  };
}
