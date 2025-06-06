import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/page2.dart';
import 'package:misdeptapp/routes/app_routes.dart';
import 'package:misdeptapp/views/landing/components/footer.dart';
import 'package:misdeptapp/views/landing/components/healthcarejourney.dart';
import 'package:misdeptapp/views/landing/components/healthcaresection.dart';
import 'package:misdeptapp/views/landing/components/healthregulation.dart';
import 'package:misdeptapp/views/landing/components/homepage.dart';
import 'package:misdeptapp/views/landing/components/topbar.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';
import 'package:misdeptapp/views/login/login_screen.dart';
import 'package:misdeptapp/views/pages/aboutus.dart';
import 'package:misdeptapp/views/pages/genesis.dart';
import 'package:misdeptapp/views/pages/responsibities.dart';
import 'package:misdeptapp/views/pages/visionnmission.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  Widget getPage(String key) {
    switch (key) {
      case 'landing':
        return const DirectorateMISPage();
      //   return const MainPage();
      case 'About Us':
        return const AboutusPage();
      case 'Vision & Mission':
        return const VisionPage();
      case 'Genesis & Evolution':
        return const GenesisPage();
      case 'Core Responsibilities':
        return const CoreResponsibilitiesPage();
      default:
        return const MainPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final LandingController landcon = Get.put(LandingController());
    return GetBuilder<LandingController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(left: 70),
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  landcon.setcurrentpage('landing', 0);
                },
                child: Image.asset(
                  'assets/images/logo2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            actions: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  landcon.setcurrentpage('landing', 0);
                },

                child: const Text(
                  "MIS DEPARTMENT\nMANIPUR",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              TopNavWithModalMenu(),
              OutlinedButton(
                onPressed: () {
                  log('login');
                  Get.toNamed(AppRoutes.login);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(width: 15),
              MaterialButton(
                minWidth: 80,

                onPressed: () {},
                child: SizedBox(height: 30, child: Icon(Icons.search)),
              ),
              SizedBox(width: 20),
            ],
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 1,
          ),
          body: SingleChildScrollView(
            child:
                landcon.currentPage == 'landing'
                    ? getPage(landcon.currentPage)
                    : Column(
                      children: [getPage(landcon.currentPage), FooterSection()],
                    ),
          ),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        HomePage(),
        HealthcareStatsSection(),
        HealthcareJourneySection(),
        HealthRegulationsSection(),
        FooterSection(),
      ],
    );
  }
}
