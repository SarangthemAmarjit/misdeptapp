import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class VisionPage extends StatelessWidget {
  const VisionPage({super.key});

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
                child: Row(
                  children: [
                    // Row(
                    //   children: [
                    //     _breadcrumbLink(
                    //       text: "Home",
                    //       ontap: () {
                    //         lancon.setcurrentpage('landing', 0);
                    //       },
                    //     ),
                    //     const Text(" > "),
                    //     _breadcrumbLink(
                    //       text: menuItems[lancon.selectedmenuindex].title,
                    //       ontap: null,
                    //     ),
                    //     const Text(" > "),
                    //     _breadcrumbText(lancon.currentPage),
                    //   ],
                    // ),
                    // const SizedBox(height: 30),

                    // Page title
                    Text(
                      'Vision & Mission',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vision',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '''To institutionalize a real-time, unified digital governance ecosystem that enhances transparency, facilitates informed decision-making, and ensures accountability across all state government functions..

 ''',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mission',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: missions.length,
                      itemBuilder:
                          (context, ind) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.shareFromSquare),
                                SizedBox(width: 10),
                                Text(missions[ind]),
                              ],
                            ),
                          ),
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
