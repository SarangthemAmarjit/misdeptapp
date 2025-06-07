import 'package:flutter/material.dart';

class HealthRegulationsSection extends StatelessWidget {
  const HealthRegulationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 247, 230),
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          isSmallScreen
              ? Column(
                children: [
                  Image.asset(
                    'assets/images/health-regulations.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(padding: const EdgeInsets.all(24), child: _Content()),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/health-regulations.jpg',
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: _Content(),
                    ),
                  ),
                ],
              ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Health regulations',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'The Ministry and its respective agencies regulate the public health system to deliver better health outcomes for all Singaporeans.',
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: const BorderSide(color: Colors.blue),
          ),
          child: const Text(
            "More details",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
