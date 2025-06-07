import 'package:flutter/material.dart';
import 'package:misdeptapp/config/responsive.dart';
import 'package:misdeptapp/notice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ismobile =
        Responsive.isMobile(context) || Responsive.isMobtab(context);

    final isTablet = Responsive.isTablet(context);

    Widget leftContent = Container(
      width: ismobile ? double.infinity : null,
      height: ismobile ? null : size.height * 0.70,
      color: const Color(0xFF237570),
      padding: const EdgeInsets.all(32),
      child: Padding(
        padding: EdgeInsets.only(left: ismobile ? 30 : 50),
        child: Align(
          alignment: ismobile ? Alignment.centerLeft : Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: ismobile ? MainAxisSize.min : MainAxisSize.max,
            children: [
              Text(
                "Seamleass Systems\nSmarter Governance.",
                style: TextStyle(
                  fontSize:
                      ismobile
                          ? 32
                          : isTablet
                          ? 40
                          : 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Real-time employee management, transparent payroll, and secure digital records--powered by CMIS",
                style: TextStyle(fontSize: 18, color: Colors.white),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text("Learn more"),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget rightContent = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Hero_infographic.png'),
        ),
      ),
      width: ismobile ? double.infinity : null,
      height: ismobile ? 220 : size.height * 0.70,
      child: Align(alignment: Alignment.bottomRight, child: NoticeBoard()),
    );

    return Padding(
      padding: EdgeInsets.only(
        // bottom: ismobile ? 24 : size.height * 0.15,
        left: ismobile ? 0 : 0,
        right: ismobile ? 0 : 0,
      ),
      child: Container(
        color: const Color(0xFF237570),
        child:
            ismobile
                ? Column(children: [leftContent, rightContent])
                : Row(
                  children: [
                    Expanded(flex: 1, child: leftContent),
                    Expanded(flex: 1, child: rightContent),
                  ],
                ),
      ),
    );
  }
}
