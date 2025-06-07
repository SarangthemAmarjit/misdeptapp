import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/views/landing/components/footer.dart';
import 'package:misdeptapp/views/landing/components/healthcarejourney.dart';
import 'package:misdeptapp/views/landing/components/healthregulation.dart';
import 'package:misdeptapp/views/landing/components/homepage.dart';

class DirectorateMISPage extends StatelessWidget {
  const DirectorateMISPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // // Header
          // _buildHeader(),
          // Hero Section
          HomePage(),
          // Content Sections
          _buildContentSections(),
          // Footer
          FooterSection(),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 480;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: isSmallScreen ? null : BorderRadius.circular(12),
          image: DecorationImage(
            image: const NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuBbvjo0laaVK2zgTIrpBVItkd3QsqwN1hqKz_N92GBMYZSO7yHuTC5kz0vPV-O32fNnALI2VTH-XVcf9hVXIkJ99GNYHqrsnpzKsqnmkIgw0RlWXB6H1APVkncxiDu7ZfS1uRf0qUD-PhWVbhqucxa8SoTTSioLpniDfEtymkOERpEgCCr52lS055tdevyufXM9KG2gQsXZt69weoVC8kFQ4ei42MERvNtKvf_OaFnPyzUcpvM7_ZmqJhZaxV1v8IwQWXERYp3EsPSO",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black12, Colors.black54],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Text(
                    'Directorate of Management Information System (MIS)',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 32 : 40,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                      letterSpacing: -0.015,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Finance Department, Government of Manipur',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: isSmallScreen ? 40 : 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB8CEE4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Explore CMIS Portal',
                  style: GoogleFonts.publicSans(
                    color: const Color(0xFF111418),
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSections() {
    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.only(
              left: 200,
              right: 200,
              top: 100,
              bottom: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('About Us'),
                _buildParagraph(
                  'The Directorate of Management Information System (MIS) is a pivotal entity within the Finance Department of the Government of Manipur. Our mission is to spearhead e-governance initiatives and ensure robust data management across the state. We are committed to leveraging technology to enhance efficiency, transparency, and accountability in financial administration.',
                ),
                _buildSectionTitle('Vision and Mission'),
                _buildParagraph(
                  'Our vision is to transform financial governance in Manipur through innovative technology solutions. Our mission is to provide cutting-edge MIS services, ensuring seamless data integration, process automation, and informed decision-making.',
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.only(
              left: 200,
              right: 200,
              top: 50,
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _buildSectionTitle('Genesis and Evolution'),
                // _buildTimeline(),
                _buildSectionTitle('Core Responsibilities'),
                _buildResponsibilitiesGrid(),

                // _buildSectionTitle('CMIS Modules & Functional Features'),
                // _buildModulesTable(),
                // _buildSectionTitle('Departments and Scope'),
                // _buildParagraph(
                //   'CMIS is integrated with various departments across the Government of Manipur, including: Department of Finance, Department of Education, Department of Health, Department of Public Works, and more.',
                // ),
                // _buildSectionTitle('Governance Impact & Recognition'),
                // _buildParagraph(
                //   'The implementation of CMIS has significantly improved financial governance in Manipur, leading to enhanced transparency, efficiency, and accountability. Our efforts have been recognized with the prestigious CSI SIG eGovernance Award for excellence in e-governance.',
                // ),
                // _buildSectionTitle('Latest Enhancements'),
                // _buildParagraph(
                //   'We continuously enhance the CMIS portal with new features and updates. Recent enhancements include: Improved user interface, Enhanced reporting capabilities, Mobile accessibility, and Integration with new departments.',
                // ),
                // _buildSectionTitle('Contact Us'),
                // _buildParagraph(
                //   'Directorate of Management Information System (MIS), Finance Department, Government of Manipur, Imphal, Manipur, India. Email: mis@manipur.gov.in Phone: +91-385-242XXXX',
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 12),
                //   child: SizedBox(
                //     width: 200,
                //     height: 40,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: const Color(0xFFB8CEE4),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(12),
                //         ),
                //       ),
                //       onPressed: () {},
                //       child: Text(
                //         'Access CMIS Portal',
                //         style: GoogleFonts.publicSans(
                //           color: const Color(0xFF111418),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 14,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),

        Column(
          children: [HealthcareJourneySection(), HealthRegulationsSection()],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Text(
        text,
        style: GoogleFonts.publicSans(
          color: const Color(0xFF111418),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          height: 1.2,
          letterSpacing: -0.015,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Text(
        text,
        style: GoogleFonts.publicSans(
          color: const Color(0xFF111418),
          fontSize: 16,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTimelineItem(
            iconData: FontAwesomeIcons.calendar,
            title: 'Establishment of MIS Directorate',
            subtitle: '2010',
          ),
          buildTimelineItem(
            iconData: FontAwesomeIcons.database,
            title: 'Implementation of CMIS',
            subtitle: '2015',
          ),
          buildTimelineItem(
            iconData: FontAwesomeIcons.city,
            title: 'Integration with State Departments',
            subtitle: '2018–Present',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget buildTimelineItem({
    required IconData iconData,
    required String title,
    required String subtitle,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(iconData, size: 20, color: const Color(0xFF111418)),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 1.5,
                    height: 50,
                    color: const Color(0xFFD5DBE2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.publicSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF111418),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.publicSans(
                  fontSize: 16,
                  color: const Color(0xFF5E7387),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildTimelineItem({
  //   required Widget icon,
  //   required String title,
  //   required String date,
  //   bool isLast = false,
  // }) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Column(
  //         children: [
  //           icon,
  //           if (!isLast)
  //             Container(
  //               width: 1.5,
  //               height: 24,
  //               color: const Color(0xFFD5DBE2),
  //             ),
  //         ],
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 12),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title,
  //               style: GoogleFonts.publicSans(
  //                 color: const Color(0xFF111418),
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             Text(
  //               date,
  //               style: GoogleFonts.publicSans(
  //                 color: const Color(0xFF5E7387),
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildResponsibilitiesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 3.5 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/data.png', height: 60),
            title: 'Data Governance',
            description: 'Ensuring data integrity and accessibility.',
          ),
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/payroll.png', height: 60),
            title: 'Payroll Integration',
            description: 'Streamlining payroll processes across departments.',
          ),
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/processautomation.png', height: 60),
            title: 'Process Automation',
            description: 'Automating key financial workflows.',
          ),
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/security.png', height: 60),
            title: 'Security & Compliance',
            description:
                'Maintaining high security standards and regulatory compliance.',
          ),
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/analytics.png', height: 60),
            title: 'Analytics & Reporting',
            description:
                'Providing insightful financial analytics and reports.',
          ),
          _buildResponsibilityCard(
            icon: Image.asset('assets/icons/usersupports.png', height: 60),
            title: 'User Support',
            description: 'Offering comprehensive support to CMIS users.',
          ),
        ],
      ),
    );
  }

  Widget _buildResponsibilityCard({
    required Widget icon,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD5DBE2)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.publicSans(
              color: const Color(0xFF111418),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.publicSans(
              color: const Color(0xFF5E7387),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModulesTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD5DBE2)),
        ),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          border: TableBorder(
            horizontalInside: BorderSide(
              color: const Color(0xFFD5DBE2),
              width: 1,
            ),
          ),
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                border: Border.all(color: const Color(0xFFD5DBE2)),
              ),
              children: [
                _buildTableHeader('Module'),
                _buildTableHeader('Description'),
                _buildTableHeader('Key Features'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Budget Management'),
                _buildTableCell('Manages budget allocation and tracking.'),
                _buildTableCell(
                  'Budget creation, fund allocation, expenditure tracking.',
                ),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Payroll System'),
                _buildTableCell('Automates employee payroll processing.'),
                _buildTableCell(
                  'Salary calculation, tax deductions, payslip generation.',
                ),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Reporting & Analytics'),
                _buildTableCell('Provides financial reports and analytics.'),
                _buildTableCell(
                  'Customizable reports, data visualization, trend analysis.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: GoogleFonts.publicSans(
          color: const Color(0xFF111418),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: GoogleFonts.publicSans(
          color: const Color(0xFF5E7387),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      constraints: const BoxConstraints(maxWidth: 960),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildFooterLink(
                'Directorate of Management Information System (MIS), Babupara, Imphal – 795001',
              ),
              _buildFooterLink('Email: support-cmis@gov.in'),
              _buildFooterLink('Phone: +91-9402537620'),
              _buildFooterLink(
                'CMIS Portal: https://cmis.man.nic.in/sevaarth/home1/sevaarthhome.php',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '© 2024 Directorate of Management Information System (MIS). All rights reserved.',
            style: GoogleFonts.publicSans(
              color: const Color(0xFF5E7387),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 160),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.publicSans(
          color: const Color(0xFF5E7387),
          fontSize: 16,
        ),
      ),
    );
  }
}
