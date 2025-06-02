import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class VaccicationPage extends StatelessWidget {
  const VaccicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    LandingController lancon = Get.put(LandingController());
    final sideMenuItems = [
      "National Childhood Immunisation Schedule",
      "National Adult Immunisation Schedule",
      "Vaccination matters",
      "Subsidies",
      "Related content",
    ];

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
                        _breadcrumbLink("Home"),
                        const Text(" > "),
                        _breadcrumbLink(
                          menuItems[lancon.selectedmenuindex].title,
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

                    // Subtitle
                    Text(
                      "Find information about nationally recommended vaccines for children and adults in Singapore.",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Last updated
                    Text(
                      "Last updated 30 May 2025",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left navigation
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("On this page", style: _sectionHeading()),
                          const SizedBox(height: 10),
                          ...sideMenuItems.map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  // Right sidebar
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Back to",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Staying healthy",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF1B3D6D),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Other pages in Staying healthy",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Start early for better health",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF1B3D6D),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "See all pages",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Icon(Icons.arrow_upward, color: Colors.blue),
                          const SizedBox(height: 4),
                          const Text(
                            "Back to top",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _breadcrumbLink(String text) => InkWell(
    onTap: () {},
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.blue,
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
