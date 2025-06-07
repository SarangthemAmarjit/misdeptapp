import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/core/services/api_service.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/controller/admin_controller.dart';

class LandingController extends GetxController {
  String _currentpage = 'landing';
  String? pendingScrollTarget;
  final int _selectedmenuindex = 0;
  int _selectedadminpageindex = 0;
  String _admincurrentpage = 'dashboard';
  int get selectedmenuindex => _selectedmenuindex;
  String get currentPage => _currentpage;
  String get admincurrentpage => _admincurrentpage;
  int get selectedadminpageindex => _selectedadminpageindex;

  @override
  void onInit() {
    Get.find<AdminController>().getalldatas();
    super.onInit();
  }

  void setcurrentpage(String page, int index, {String? scrollTo}) {
    _currentpage = page;
    if (scrollTo != null) {
      pendingScrollTarget = page;
    }
    update(); // triggers rebuild
    scrollToSection(page);
  }

  void setadmincurrentpage(String page, int ind) {
    // Your _logic here
    _admincurrentpage = page;
    _selectedadminpageindex = ind;
    update(); // Notify listeners about the change
  }

  // Scroll logic
  final scrollController = ScrollController();

  // Section keys for scroll targets
  final aboutsectionKeys = {
    'About Us': GlobalKey(),
    'Vision & Mission': GlobalKey(),
    'Genesis & Evolution': GlobalKey(),
  };

  void scrollToSection(String sectionName) {
    log(sectionName.toString());
    final key = aboutsectionKeys[sectionName];
    if (key != null && key.currentContext != null) {
      log('key not null');
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      pendingScrollTarget = null; // reset
    }
  }

  void checkPendingScroll() {
    if (pendingScrollTarget != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToSection(pendingScrollTarget!);
      });
    }
  }
}
