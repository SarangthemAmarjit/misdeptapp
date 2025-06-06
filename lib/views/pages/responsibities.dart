import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class CoreResponsibilitiesPage extends StatelessWidget {
  const CoreResponsibilitiesPage({super.key});

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
                  _sectionHeading("Data Governance"),
                  _bullet(
                    "Maintain a comprehensive and up-to-date employee database (regular, contractual, ad-hoc, work-charged, VDF, GIA, etc.).",
                  ),
                  _bullet(
                    "Ensure data verification and digital validation in compliance with government norms.",
                  ),
                  const SizedBox(height: 24),

                  _sectionHeading("Payroll Integration"),
                  _bullet(
                    "Generate accurate, automated salary bills via the CMIS Salary Bill Portal.",
                  ),
                  _bullet(
                    "Integrate seamlessly with TreasuryNET, BEAMS, and e-Kuber platforms for fund authorization, cheque drawal, and e-payment.",
                  ),
                  const SizedBox(height: 24),

                  _sectionHeading("Process Automation"),
                  _bullet(
                    "Automate transfer, promotion, new recruit entries, post creation, and corrections.",
                  ),
                  _bullet(
                    "Enable e-verification, online approvals, and system-generated reports for transparency.",
                  ),
                  const SizedBox(height: 24),

                  _sectionHeading("Policy Implementation & Oversight"),
                  _bullet(
                    "Issue general instructions to departments regarding data updates and recruitment inputs.",
                  ),
                  _bullet(
                    "Ensure compliance with national data security protocols, including password management and authorized access control.",
                  ),
                  const SizedBox(height: 24),

                  _sectionHeading("Training & Capacity Building"),
                  _bullet(
                    "Conduct workshops and departmental trainings on CMIS functionalities, data entry norms, and system utilization.",
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

  Widget _sectionHeading(String title) => Text(
    title,
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );

  Widget _bullet(String text) => Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
