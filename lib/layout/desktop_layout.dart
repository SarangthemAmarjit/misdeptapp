import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desktop Layout')),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Desktop Layout!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
