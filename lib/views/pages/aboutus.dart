import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

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

                    // Page title
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
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    Text(
                      '''The Directorate of Management Information System (MIS) is the central agency established under the Finance Department, Government of Manipur, to drive e-Governance and data-centric decision-making. Founded in 2008, the Directorate was created with a strategic vision to modernize financial and personnel systems, streamline interdepartmental processes, and ensure accountability through integrated digital platforms.

 ''',
                    ),

                    Text(
                      '''The Directorate manages and develops the Central Management Information System (CMIS) — a comprehensive, web-based software suite for employee management, payroll integration, and sanctioned post tracking, encompassing all Government of Manipur departments, autonomous bodies, and public sector undertakings. ''',
                    ),
                  ],
                ),
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

  TextStyle _sectionHeading() => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
}
