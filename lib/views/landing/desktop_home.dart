import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/views/landing/components/footer.dart';
import 'package:misdeptapp/views/landing/components/healthcarejourney.dart';
import 'package:misdeptapp/views/landing/components/healthcaresection.dart';
import 'package:misdeptapp/views/landing/components/healthregulation.dart';
import 'package:misdeptapp/views/landing/components/homepage.dart';
import 'package:misdeptapp/views/landing/components/topbar.dart';
import 'package:misdeptapp/views/landing/components/topbar2.dart';
import 'package:misdeptapp/views/login/login_screen.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/images/logo2.png', fit: BoxFit.contain),
        ),
        title: const Text(
          "MIS DEPARTMENT\nMANIPUR",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          TopNavWithModalMenu(),
          OutlinedButton(
            onPressed: () {
              Get.to(AdminLoginScreen());
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              side: const BorderSide(color: Colors.blue),
            ),
            child: const Text("Login", style: TextStyle(color: Colors.blue)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            HomePage(),
            HealthcareStatsSection(),
            HealthcareJourneySection(),
            HealthRegulationsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
