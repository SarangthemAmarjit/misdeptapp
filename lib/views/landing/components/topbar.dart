import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class TopNavMenu extends StatelessWidget {
  const TopNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        PullDownNavMenu(
          title: "Staying healthy",
          submenuItems: [
            SubMenuItem(label: "Fitness", icon: Icons.fitness_center),
            SubMenuItem(label: "Nutrition", icon: Icons.restaurant),
            SubMenuItem(label: "Mental Health", icon: Icons.psychology),
          ],
        ),
        PullDownNavMenu(
          title: "Seeking healthcare",
          submenuItems: [
            SubMenuItem(label: "Find a Doctor", icon: Icons.local_hospital),
            SubMenuItem(label: "Emergency", icon: Icons.emergency),
          ],
        ),
        PullDownNavMenu(
          title: "Ageing well",
          submenuItems: [
            SubMenuItem(label: "Mobility", icon: Icons.accessibility),
            SubMenuItem(label: "Memory Care", icon: Icons.memory),
          ],
        ),
        PullDownNavMenu(
          title: "Managing expenses",
          submenuItems: [
            SubMenuItem(label: "Insurance", icon: Icons.shield),
            SubMenuItem(label: "Bills", icon: Icons.receipt),
            SubMenuItem(label: "Savings", icon: Icons.savings),
          ],
        ),
        SimpleNavText(title: "Newsroom"),
        PullDownNavMenu(
          title: "Resources",
          submenuItems: [
            SubMenuItem(label: "Help Center", icon: Icons.help),
            SubMenuItem(label: "Contact Us", icon: Icons.contact_mail),
          ],
        ),
      ],
    );
  }
}

class SubMenuItem {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const SubMenuItem({required this.label, required this.icon, this.onTap});
}

class PullDownNavMenu extends StatelessWidget {
  final String title;
  final List<SubMenuItem> submenuItems;

  const PullDownNavMenu({
    super.key,
    required this.title,
    required this.submenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: PullDownButton(
        animationAlignmentOverride: Alignment.centerLeft,
        buttonAnchor: PullDownMenuAnchor.end,

        itemBuilder:
            (context) =>
                submenuItems
                    .map(
                      (item) => PullDownMenuItem(
                        itemTheme: PullDownMenuItemTheme(),
                        onTap: item.onTap,
                        title: item.label,
                        icon: item.icon,
                      ),
                    )
                    .toList(),
        buttonBuilder:
            (context, showMenu) => MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: showMenu,
              child: Row(
                children: [
                  Text(title, style: const TextStyle(fontSize: 14.5)),
                  const Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
      ),
    );
  }
}

class SimpleNavText extends StatelessWidget {
  final String title;

  const SimpleNavText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(title, style: const TextStyle(fontSize: 14.5)),
      ),
    );
  }
}
