import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedItemIndex = -1; // 0 will be selected 1st item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Image.asset('assets/images/logo2.png', height: 50),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(text: 'MIS DEPARTMENT\n'),
                      TextSpan(
                        text: 'MANIPUR',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sidebarItems.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedItemIndex == index;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(sidebarItems[index].icon),
                      trailing:
                          sidebarItems[index].expandableTiles.isEmpty
                              ? null
                              : Icon(
                                isSelected
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                              ),
                      title: Text(sidebarItems[index].title),
                      onTap: () {
                        if (sidebarItems[index].expandableTiles.isEmpty) {
                          // Close drawer if it's a direct item
                          Navigator.pop(context);
                          sidebarItems[index].onTap?.call();
                        } else {
                          setState(() {
                            _selectedItemIndex = isSelected ? -1 : index;
                          });
                        }
                      },
                    ),
                    if (isSelected)
                      Column(
                        children:
                            sidebarItems[index].expandableTiles.map((tile) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                ), // indent subitems
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context); // Close drawer
                                    debugPrint("Tapped $tile");
                                    // Add additional logic here if needed
                                  },
                                  hoverColor: Colors.blue[100],
                                  title: Text(tile),
                                ),
                              );
                            }).toList(),
                      ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem {
  final String title;
  final IconData icon;
  final List<String> expandableTiles;
  final VoidCallback? onTap;

  SidebarItem({
    required this.title,
    required this.icon,
    this.expandableTiles = const [],
    this.onTap,
  });
}

List<SidebarItem> sidebarItems = [
  SidebarItem(
    title: 'Staying healthy',
    icon: Icons.favorite, // Example icon, change as needed
    expandableTiles: ['Fitness', 'Nutrition', 'Mental Health'],
  ),
  SidebarItem(
    title: 'Seeking healthcare',
    icon: Icons.local_hospital,
    expandableTiles: ['Find a Doctor', 'Emergency'],
  ),
  SidebarItem(
    title: 'Ageing well',
    icon: Icons.elderly,
    expandableTiles: ['Mobility', 'Memory Care'],
  ),
  SidebarItem(
    title: 'Managing expenses',
    icon: Icons.account_balance_wallet,
    expandableTiles: ['Insurance', 'Bills', 'Savings'],
  ),
  SidebarItem(
    title: 'Resources',
    icon: Icons.help_outline,
    expandableTiles: ['Help Center', 'Contact Us'],
  ),
  SidebarItem(
    title: 'About',
    icon: Icons.info_outline,
    expandableTiles: [], // No dropdown
    onTap: () => debugPrint("Tapped About"),
  ),
];
