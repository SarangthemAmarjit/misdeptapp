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
                  children: [
                    ListTile(
                      leading: Icon(sidebarItems[index].icon),
                      trailing: Icon(
                        isSelected
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      title: Text(sidebarItems[index].title),
                      onTap: () {
                        setState(() {
                          _selectedItemIndex = isSelected ? -1 : index;
                        });
                      },
                    ),
                    if (isSelected)
                      Column(
                        children:
                            sidebarItems[index].expandableTiles.map((tile) {
                              return ListTile(
                                onTap: () {},
                                hoverColor: Colors.blue[100],

                                title: Text(tile),
                              );
                            }).toList(),
                      ),
                    const Divider(), // divider between items
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

  SidebarItem({
    required this.title,
    required this.icon,
    required this.expandableTiles,
  });
}

List<SidebarItem> sidebarItems = [
  SidebarItem(
    title: 'Home',
    icon: Icons.home,
    expandableTiles: ['Subitem 1', 'Subitem 2'],
  ),
  SidebarItem(
    title: 'Settings',
    icon: Icons.settings,
    expandableTiles: ['Subitem 1', 'Subitem 2'],
  ),
  // Add more items if you need
];
