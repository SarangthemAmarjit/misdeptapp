import 'package:flutter/material.dart';
import 'package:misdeptapp/config/responsive.dart';

class HealthcareStatsSection extends StatelessWidget {
  const HealthcareStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ismobile =
        Responsive.isMobile(context) || Responsive.isMobtab(context);
    final isTablet = Responsive.isTablet(context);

    // Adjust font size responsively
    double titleFontSize =
        Responsive.isMobile(context)
            ? 24
            : Responsive.isMobtab(context)
            ? 34
            : isTablet
            ? 38
            : 50;

    double statFontSize =
        Responsive.isMobile(context)
            ? 30
            : Responsive.isMobtab(context)
            ? 42
            : isTablet
            ? 28
            : 50;

    double spacing =
        ismobile
            ? 10
            : isTablet
            ? 40
            : 60;

    double runSpacing =
        ismobile
            ? 10
            : isTablet
            ? 28
            : 32;

    int statColumns =
        ismobile
            ? 2
            : isTablet
            ? 4
            : 4;

    return Padding(
      padding: EdgeInsets.only(
        left: ismobile ? 8 : 20,
        right: ismobile ? 8 : 20,
        bottom: ismobile ? 24 : 48,
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
          SizedBox(height: ismobile ? 16 : 32),
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ismobile
                          ? 50
                          : isTablet
                          ? 60
                          : 100,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: statColumns,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: runSpacing,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: ismobile ? 2 / 2 : 5 / 4,
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
          SizedBox(height: ismobile ? 16 : 32),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: ismobile ? 16 : 24,
                vertical: ismobile ? 8 : 12,
              ),
              side: const BorderSide(color: Colors.blue),
            ),
            child: Text(
              "More details",
              style: TextStyle(
                color: Colors.blue,
                fontSize: ismobile ? 14 : 16,
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
      mainAxisSize: MainAxisSize.min,
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
