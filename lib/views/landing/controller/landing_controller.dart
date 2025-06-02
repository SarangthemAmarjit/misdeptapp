import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';

class LandingController extends GetxController {
  String _currentpage = 'landing';
  int _selectedmenuindex = 0;
  int get selectedmenuindex => _selectedmenuindex;
  String get currentPage => _currentpage;

  void setcurrentpage(String page, int ind) {
    // Your _logic here
    _currentpage = page;
    _selectedmenuindex = ind;
    update(); // Notify listeners about the change
  }
}
