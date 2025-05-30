import 'package:flutter/material.dart';

class HealthcareStatsSection extends StatelessWidget {
  const HealthcareStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 600;
    final isTablet = width >= 600 && width < 900;

    // Adjust font size responsively
    double titleFontSize =
        isSmallScreen
            ? 28
            : isTablet
            ? 38
            : 50;

    double statFontSize =
        isSmallScreen
            ? 32
            : isTablet
            ? 44
            : 55;

    double spacing =
        isSmallScreen
            ? 20
            : isTablet
            ? 40
            : 60;

    double runSpacing =
        isSmallScreen
            ? 20
            : isTablet
            ? 28
            : 32;

    int statColumns =
        isSmallScreen
            ? 2
            : isTablet
            ? 4
            : 4;

    return Padding(
      padding: EdgeInsets.only(
        left: isSmallScreen ? 8 : 20,
        right: isSmallScreen ? 8 : 20,
        bottom: isSmallScreen ? 24 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Healthcare at a glance",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 16 : 32),
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: statColumns,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: runSpacing,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: isSmallScreen ? 1.8 : 1.6,
                  children: [
                    _StatItem(
                      number: "12,000",
                      label: "public hospital beds",
                      fontSize: statFontSize,
                    ),
                    _StatItem(
                      number: "19,200",
                      label: "nursing home beds",
                      fontSize: statFontSize,
                    ),
                    _StatItem(
                      number: "26",
                      label: "polyclinics",
                      fontSize: statFontSize,
                    ),
                    _StatItem(
                      number: "1,400",
                      label: "CHAS GP Clinics",
                      fontSize: statFontSize,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: isSmallScreen ? 16 : 32),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16 : 24,
                vertical: isSmallScreen ? 8 : 12,
              ),
              side: const BorderSide(color: Colors.blue),
            ),
            child: Text(
              "More details",
              style: TextStyle(
                color: Colors.blue,
                fontSize: isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final double fontSize;

  const _StatItem({
    required this.number,
    required this.label,
    this.fontSize = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0C5A7C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
