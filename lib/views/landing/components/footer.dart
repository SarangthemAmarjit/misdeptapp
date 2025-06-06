import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 800;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 960),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 16,
              children: const [
                _FooterLink(
                  'Directorate of Management Information System (MIS), Babupara, Imphal – 795001',
                ),
                _FooterLink('Email: support-cmis@gov.in'),
                _FooterLink('Phone: +91-9402537620'),
                _FooterLink(
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.publicSans(
        color: const Color(0xFF5E7387),
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }
}
