import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  String userName;
  String phone;
  String password;
  DateTime? date;

  UserModel({
    required this.id,
    required this.userName,
    required this.phone,
    required this.password,
    this.date,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["Id"],
    userName: json["UserName"],
    phone: json["Phone"],
    password: json["Password"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "UserName": userName,
    "Phone": phone,
    "Password": password,
    "Date": date?.toIso8601String(),
  };
}
