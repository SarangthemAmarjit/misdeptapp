import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 700;

    Widget leftContent = Container(
      width: isMobile ? double.infinity : null,
      height: isMobile ? null : size.height * 0.80,
      color: const Color(0xFF0C5A7C),
      padding: const EdgeInsets.all(32),
      child: Padding(
        padding: EdgeInsets.only(left: isMobile ? 0 : 50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
            children: [
              Text(
                "Improving Our\nHealth In The\nNext Bound",
                style: TextStyle(
                  fontSize: isMobile ? 32 : 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "MOH Committee of Supply 2025",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                child: const Text("Find out more"),
              ),
            ],
          ),
        ),
      ),
    );

    Widget rightContent = SizedBox(
      width: isMobile ? double.infinity : null,
      height: isMobile ? 220 : size.height * 0.80,
      child: Image.asset('assets/images/landing.png', fit: BoxFit.cover),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: isMobile ? 24 : size.height * 0.15,
        left: isMobile ? 0 : 0,
        right: isMobile ? 0 : 0,
      ),
      child:
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [leftContent, rightContent],
              )
              : Row(
                children: [
                  Expanded(flex: 1, child: leftContent),
                  Expanded(flex: 1, child: rightContent),
                ],
              ),
    );
  }
}
