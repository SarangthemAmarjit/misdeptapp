import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/core/services/api_service.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';

class LandingController extends GetxController {
  String _currentpage = 'landing';
  int _selectedmenuindex = 0;
   int _selectedadminpageindex = 0;
    String _admincurrentpage = 'dashboard';
  int get selectedmenuindex => _selectedmenuindex;
  String get currentPage => _currentpage;
  String get admincurrentpage => _admincurrentpage;
  int get selectedadminpageindex => _selectedadminpageindex;

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  getdata() async {
    log('Fetching data from API...');
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Accounts', headers: {'Content-Type': 'application/json'});

    log(response.statusCode.toString());
  }

  void setcurrentpage(String page, int ind) {
    // Your _logic here
    _currentpage = page;
    _selectedmenuindex = ind;
    update(); // Notify listeners about the change
  }

   void setadmincurrentpage(String page, int ind) {
    // Your _logic here
    _admincurrentpage = page;
    _selectedadminpageindex = ind;
    update(); // Notify listeners about the change
  }
}
