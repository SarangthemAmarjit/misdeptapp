import 'dart:convert';

List<GalleryModel> galleryModelFromJson(String str) => List<GalleryModel>.from(
  json.decode(str).map((x) => GalleryModel.fromJson(x)),
);

String galleryModelToJson(List<GalleryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryModel {
  int id;
  int gcid;
  String title;
  DateTime date;
  String description;
  String imagePath;

  GalleryModel({
    required this.id,
    required this.gcid,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    id: json["Id"],
    gcid: json["Gcid"],
    title: json["Title"],
    date: DateTime.parse(json["Date"]),
    description: json["Description"],
    imagePath: json["ImagePath"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Gcid": gcid,
    "Title": title,
    "Date": date.toIso8601String(),
    "Description": description,
    "ImagePath": imagePath,
  };
}
