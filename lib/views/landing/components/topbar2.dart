import 'package:flutter/material.dart';

class TopNavWithModalMenu extends StatefulWidget {
  const TopNavWithModalMenu({super.key});

  @override
  State<TopNavWithModalMenu> createState() => _TopNavWithModalMenuState();
}

class _TopNavWithModalMenuState extends State<TopNavWithModalMenu> {
  final List<GlobalKey> navKeys = List.generate(5, (_) => GlobalKey());
  int? activeIndex;

  void _showDropdownModal(
    BuildContext context,
    List<String> items,
    Offset offset,
    int index,
  ) {
    setState(() {
      activeIndex = index;
    });

    showGeneralDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() => activeIndex = null);
              },
              child: Container(color: Colors.transparent),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy + 48,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    children:
                        items
                            .map(
                              (item) => ListTile(
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                hoverColor: Colors.blue[100],
                                title: Text(item),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() => activeIndex = null);
                                  debugPrint("Tapped $item");
                                },
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    ).then((_) => setState(() => activeIndex = null));
  }

  void _onNavTap(
    BuildContext context,
    GlobalKey key,
    List<String> items,
    int index,
  ) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    _showDropdownModal(context, items, offset, index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NavButton(
            key: navKeys[0],
            title: "Staying healthy",
            isOpen: activeIndex == 0,
            onTap:
                () => _onNavTap(context, navKeys[0], [
                  "Fitness",
                  "Nutrition",
                  "Mental Health",
                ], 0),
          ),
          _NavButton(
            key: navKeys[1],
            title: "Seeking healthcare",
            isOpen: activeIndex == 1,
            onTap:
                () => _onNavTap(context, navKeys[1], [
                  "Find a Doctor",
                  "Emergency",
                ], 1),
          ),
          _NavButton(
            key: navKeys[2],
            title: "Ageing well",
            isOpen: activeIndex == 2,
            onTap:
                () => _onNavTap(context, navKeys[2], [
                  "Mobility",
                  "Memory Care",
                ], 2),
          ),
          _NavButton(
            key: navKeys[3],
            title: "Managing expenses",
            isOpen: activeIndex == 3,
            onTap:
                () => _onNavTap(context, navKeys[3], [
                  "Insurance",
                  "Bills",
                  "Savings",
                ], 3),
          ),
          _NavButton(
            key: navKeys[4],
            title: "Resources",
            isOpen: activeIndex == 4,
            onTap:
                () => _onNavTap(context, navKeys[4], [
                  "Help Center",
                  "Contact Us",
                ], 4),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final bool isOpen;
  final VoidCallback onTap;

  const _NavButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 14.5)),
            Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
