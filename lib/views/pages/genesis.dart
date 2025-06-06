import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class GenesisPage extends StatelessWidget {
  const GenesisPage({super.key});

  @override
  Widget build(BuildContext context) {
    LandingController lancon = Get.put(LandingController());

    return GetBuilder<LandingController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs
            Container(
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 200,
                  vertical: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _breadcrumbLink(
                          text: "Home",
                          ontap: () {
                            lancon.setcurrentpage('landing', 0);
                          },
                        ),
                        const Text(" > "),
                        _breadcrumbLink(
                          text: menuItems[lancon.selectedmenuindex].title,
                          ontap: null,
                        ),
                        const Text(" > "),
                        _breadcrumbText(lancon.currentPage),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      lancon.currentPage,
                      style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // Content area
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 200,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Phase I – MGEL (2002–2005)"),
                  const SizedBox(height: 8),
                  const Text(
                    "The journey began with the Manipur Government Employees List (MGEL), developed in collaboration with the National Informatics Centre (NIC), Manipur. MGEL was designed to identify each government employee through a unique Employee Identification Number (EIN) and collect personal and departmental information for use in budgeting and payroll.",
                  ),
                  const SizedBox(height: 24),

                  _sectionTitle("Phase II – CPIS (2006–2018)"),
                  const SizedBox(height: 8),
                  const Text(
                    "In 2006, the system transitioned into the Computerization of Personnel Information System (CPIS) to enable better data validation, correction, and departmental integration. CPIS incorporated details of sanctioned posts and enabled data verification through the Finance (Budget) section.",
                  ),
                  const SizedBox(height: 24),

                  _sectionTitle("Phase III – CMIS (2019–Present)"),
                  const SizedBox(height: 8),
                  const Text(
                    "The evolution culminated in the Central Management Information System (CMIS), launched in July 2019. This robust, web-based application fully integrates employee data management with salary generation, service record maintenance, automated workflows, and policy compliance. CMIS is now an indispensable pillar of the state's Integrated Financial Management System (IFMS).",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _breadcrumbLink({
    required String text,
    required GestureTapCallback? ontap,
  }) => InkWell(
    onTap: ontap,
    child: Text(
      text,
      style: TextStyle(
        color: ontap != null ? Colors.blue : Colors.black,
        decoration: TextDecoration.underline,
      ),
    ),
  );

  Widget _breadcrumbText(String text) =>
      Text(text, style: const TextStyle(fontWeight: FontWeight.w500));

  Widget _sectionTitle(String title) => Text(
    title,
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}
