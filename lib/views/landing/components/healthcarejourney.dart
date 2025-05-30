import 'package:flutter/material.dart';
import 'package:misdeptapp/config/responsive.dart';

class HealthcareJourneySection extends StatelessWidget {
  const HealthcareJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ismobile = Responsive.isMobile(context);
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
            : isTablet
            ? 220
            : 290;
    double cardAspectRatio =
        ismobile
            ? 3 / 2.8
            : isTablet
            ? 3 / 2.4
            : 3 / 2.2;
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

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ismobile ? 32 : 48,
        horizontal: ismobile ? 12 : 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Your healthcare journey",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: GridView.builder(
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
          ),
        ],
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
