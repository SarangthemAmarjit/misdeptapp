import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/config/responsive.dart';
import 'package:misdeptapp/views/landing/desktop_home.dart';
import 'package:misdeptapp/views/landing/mobile_home.dart';
import 'package:misdeptapp/views/login/desktop_login.dart';
import 'package:misdeptapp/views/login/mobile_login.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Responsive.isMobile(context)) {
          // Mobile layout
          return const Adminloginmobile();
        } else {
          // Desktop layout
          return const Adminlogindesktop();
        }
        // You can add more conditions for tablet or use your Responsive widget here
      },
    );
  }
}
