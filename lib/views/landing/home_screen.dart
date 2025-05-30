import 'package:flutter/material.dart';
import 'package:misdeptapp/layout/base_layout.dart';
import 'package:misdeptapp/views/landing/desktop_home.dart';
import 'package:misdeptapp/views/landing/mobile_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      mobile: Landingpagemobile(),
      tablet: Landingpagemobile(),
      desktop: Landingpage(),
    );
  }
}
