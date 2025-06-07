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

import 'package:misdeptapp/views/landing/components/topbar2.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';
import 'package:misdeptapp/views/pages/about/aboutsection.dart';

import 'package:misdeptapp/views/pages/responsibities.dart';


class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  Widget getPage(String key, LandingController landcon) {
    switch (key) {
      case 'landing':
        return const DirectorateMISPage();
      //   return const MainPage();
      case 'About Us':
        return Aboutsection(
          sectionKeys: landcon.aboutsectionKeys, // 👇 pass keys
        );
      case 'Vision & Mission':
        return  Aboutsection(sectionKeys: landcon.aboutsectionKeys,);
      case 'Genesis & Evolution':
        return  Aboutsection(sectionKeys: landcon.aboutsectionKeys,);
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

            actions: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  landcon.setcurrentpage('landing', 0);
                },
                child: Image.asset(
                  height: 45,
                  'assets/images/MIS-Logo.png',
                  fit: BoxFit.contain,
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
          body: GetBuilder<LandingController>(
            builder: (_) {
              return SingleChildScrollView(
                child:
                    landcon.currentPage == 'landing'
                        ? getPage(landcon.currentPage, landcon)
                        : Column(
                          children: [
                            getPage(landcon.currentPage, landcon),
                            FooterSection(),
                          ],
                        ),
              );
            },
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
