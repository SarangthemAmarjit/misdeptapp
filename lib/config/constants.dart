import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

Color greencol = const Color(0xff008631);
Color bordercolor = const Color.fromARGB(255, 179, 179, 179);
Color bordercolorsecondary = const Color.fromARGB(255, 221, 220, 220);
Color greencolsecondary = const Color(0xff008631).withOpacity(0.3);
Color greencoltextfocus = const Color(0xff008631).withOpacity(0.5);
Color policebluecol = const Color(0xff0e0893);
Color policeredcol = const Color(0xffd40708);

final List<NavMenuItem> menuItems = [
  NavMenuItem(
    title: "Home",
    onTap: () => Get.find<LandingController>().setcurrentpage('landing', 0),
  ),
  NavMenuItem(
    title: "About",
    dropdownItems: ["About Us", "Vision & Mission", "Genesis & Evolution"],
  ),
  NavMenuItem(
    title: "Services",
    dropdownItems: [
      "Core Responsibilities",
      "CMIS Modules",
      "Departments Covered",
      "Training & Support",
    ],
  ),
  NavMenuItem(
    title: "Impact",
    dropdownItems: [
      "Governance Efficiency",
      "Transparency & Accountability",
      "Awards & Recognition",
    ],
  ),
  NavMenuItem(title: "Contact"),
];

var api = 'http://10.10.1.31';

final List<String> missions = [
  'To build and maintain a dynamic digital platform for comprehensive personnel and payroll management.',
  'To empower departments with reliable and real-time information for efficient planning and governance.',
  'To create a culture of data-driven decision-making at every administrative level.',
  'To digitize and automate key financial and HR functions such as salary disbursement, service records, promotions, and sanctioned posts.',
];
