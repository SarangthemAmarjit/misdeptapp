import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/config/responsive.dart';

class HealthcareJourneySection extends StatelessWidget {
  const HealthcareJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    log(width.toString());
    final ismobile = Responsive.isMobile(context);
    final ismobtab = Responsive.isMobtab(context);
    final isTablet = Responsive.isTablet(context);

    final List<Map<String, String>> cards = [
      {
        'image': 'assets/images/staying-healthy.jpg',
        'title': 'Staying healthy',
        'description':
            'Take proactive steps to manage your health to prevent the onset of chronic diseases.',
      },
      {
        'image': 'assets/images/seeking-healthcare.jpg',
        'title': 'Seeking healthcare',
        'description':
            'Find out when and where to seek medical help. Accessing timely and appropriate medical help is fundamental to maintaining good health.',
      },
      {
        'image': 'assets/images/managing-expenses.jpg',
        'title': 'Managing expenses',
        'description':
            'Explore healthcare financial support you can tap on. No one will be denied appropriate healthcare because they are unable to afford it.',
      },
      {
        'image': 'assets/images/ageing-well.jpeg',
        'title': 'Ageing well',
        'description':
            'Singapore\'s public healthcare policy is anchored on the philosophy of affordable healthcare for all.',
      },
    ];

    // Responsive values
    double titleFontSize =
        ismobile
            ? 28
            : isTablet
            ? 38
            : 50;
    double cardImageHeight =
        ismobile
            ? 250
            : ismobtab
            ? 190
            : isTablet
            ? 220
            : 290;
    double cardAspectRatio =
        ismobile
            ? 3 / 2.8
            : ismobtab
            ? 3 / 4.5
            : isTablet
            ? width *
                0.001 // Example: changeable value according to screen width
            : width * 0.0008;
    int crossAxisCount =
        ismobile
            ? 1
            : isTablet
            ? 2
            : 2;
    double horizontalPadding =
        ismobile
            ? 20
            : isTablet
            ? width * 0.06
            : width * 0.11;
    double crossAxisSpacing =
        ismobile
            ? 0
            : isTablet
            ? 40
            : 70;
    double mainAxisSpacing =
        ismobile
            ? 16
            : isTablet
            ? 20
            : 24;

    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(
          left: 216,
          right: 216,
          top: 70,
          bottom: 62,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your healthcare journey",
              style: GoogleFonts.publicSans(
                color: const Color(0xFF111418),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.2,
                letterSpacing: -0.015,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Find out how you are supported in managing your health at all stages of your life.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ismobile ? 20 : 32),
            Align(
              alignment: Alignment.center,
              child:
                  ismobile
                      ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: _JourneyCard(
                              imagePath: card['image']!,
                              title: card['title']!,
                              description: card['description']!,
                              imageHeight: cardImageHeight,
                            ),
                          );
                        },
                      )
                      : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cards.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: crossAxisSpacing,
                          mainAxisSpacing: mainAxisSpacing,
                          childAspectRatio: cardAspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return _JourneyCard(
                            imagePath: card['image']!,
                            title: card['title']!,
                            description: card['description']!,
                            imageHeight: cardImageHeight,
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JourneyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double imageHeight;

  const _JourneyCard({
    required this.imagePath,
    required this.title,
    required this.description,
    this.imageHeight = 290,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: imageHeight,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_forward, size: 16),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }
}
