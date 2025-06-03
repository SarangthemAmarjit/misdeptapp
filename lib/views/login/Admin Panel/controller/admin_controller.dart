import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/core/services/api_service.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/activitymodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/gallerymodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/notificationmodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/usersmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdminController extends GetxController {
  List<UserModel> _allusers = [];
  List<UserModel> get allusers => _allusers;

  List<GalleryModel> _allgallery = [];
  List<GalleryModel> get allgallery => _allgallery;

  List<NotificationModel> _allnotification = [];
  List<NotificationModel> get allnotification => _allnotification;

  List<ActivityModel> _allactivity = [];
  List<ActivityModel> get allactivity => _allactivity;

  getalldatas() {
    getallusers();
    getallgallery();
    getallnotification();
    getallrecentactivity();
  }

  void getallusers() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Accounts', headers: {'Content-Type': 'application/json'});

    var data = userModelFromJson(response.body);

    _allusers = data;
    update();
    log(_allusers.toString());
  }

  void getallgallery() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Galleries', headers: {'Content-Type': 'application/json'});

    var data = galleryModelFromJson(response.body);

    _allgallery = data;
    update();
  }

  void getallnotification() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Notifications', headers: {'Content-Type': 'application/json'});

    var data = NotificationModelFromJson(response.body);

    _allnotification = data;
    update();
  }

  void getallrecentactivity() async {
    var response = await ApiService(baseUrl: api).get(
      '/api/RecentActivities',
      headers: {'Content-Type': 'application/json'},
    );

    var data = activityModelFromJson(response.body);

    _allactivity = data;
    update();
  }

  IconData geticonforrecentactivity({
    required String title,
    required String remark,
  }) {
    if (title == 'create' && remark == 'Added new gallery image') {
      return Icons.add_a_photo;
    } else if (title == 'create' && remark == 'Added new notification') {
      return Icons.notifications;
    } else if (title == 'update') {
      return Icons.edit;
    } else {
      return Icons.delete;
    }
  }

  Color getcolorforrecentactivity({
    required String title,
    required String remark,
  }) {
    if (title == 'create' && remark == 'Added new gallery image') {
      return Color(0xFF6C72FF);
    } else if (title == 'create' && remark == 'Added new notification') {
      return Color(0xFFFF9800);
    } else if (title == 'update') {
      return Color(0xFF4CAF50);
    } else {
      return Color(0xFFF44336);
    }
  }

  String getTimeAgo(DateTime createdAt) {
    return timeago.format(createdAt);
  }
}
