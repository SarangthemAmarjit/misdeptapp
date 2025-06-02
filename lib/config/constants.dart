import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';

Color greencol = const Color(0xff008631);
Color bordercolor = const Color.fromARGB(255, 179, 179, 179);
Color bordercolorsecondary = const Color.fromARGB(255, 221, 220, 220);
Color greencolsecondary = const Color(0xff008631).withOpacity(0.3);
Color greencoltextfocus = const Color(0xff008631).withOpacity(0.5);
Color policebluecol = const Color(0xff0e0893);
Color policeredcol = const Color(0xffd40708);

final List<NavMenuItem> menuItems = [
  NavMenuItem(
    title: "Staying healthy",
    dropdownItems: ["Healthy Living", "Vaccination", "Mental Health"],
  ),
  NavMenuItem(
    title: "Seeking healthcare",
    dropdownItems: ["Find a Doctor", "Emergency"],
  ),
  NavMenuItem(title: "Ageing well", dropdownItems: ["Mobility", "Memory Care"]),
  NavMenuItem(
    title: "Managing expenses",
    dropdownItems: ["Insurance", "Bills", "Savings"],
  ),
  NavMenuItem(title: "Resources", dropdownItems: ["Help Center", "Contact Us"]),
  NavMenuItem(
    title: "About",
    onTap: () => debugPrint("Tapped About"), // No dropdown
  ),
];

var api = 'http://10.10.1.31';
