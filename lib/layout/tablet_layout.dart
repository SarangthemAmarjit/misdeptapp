import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tablet Layout')),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.selected,
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
          // Main content area
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Tablet Layout!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
