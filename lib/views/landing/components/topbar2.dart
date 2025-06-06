import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/config/responsive.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';

class NavMenuItem {
  final String title;
  final List<String>? dropdownItems;
  final VoidCallback? onTap;

  NavMenuItem({required this.title, this.dropdownItems, this.onTap});
}

class TopNavWithModalMenu extends StatefulWidget {
  const TopNavWithModalMenu({super.key});

  @override
  State<TopNavWithModalMenu> createState() => _TopNavWithModalMenuState();
}

class _TopNavWithModalMenuState extends State<TopNavWithModalMenu> {
  final List<GlobalKey> navKeys = List.generate(6, (_) => GlobalKey());
  int? activeIndex;

  void _showDropdownModal(
    BuildContext context,
    List<String> items,
    Offset offset,
    int index,
  ) {
    setState(() => activeIndex = index);

    showGeneralDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return GetBuilder<LandingController>(
          builder: (landcon) {
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
                      constraints: const BoxConstraints(maxWidth: 180),
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        children:
                            items.map((item) {
                              return ListTile(
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
                                  landcon.setcurrentpage(item, index);
                                },
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    ).then((_) => setState(() => activeIndex = null));
  }

  void _onNavTap(
    BuildContext context,
    GlobalKey key,
    NavMenuItem item,
    int index,
  ) {
    if (item.dropdownItems != null && item.dropdownItems!.isNotEmpty) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);
      _showDropdownModal(context, item.dropdownItems!, offset, index);
    } else {
      item.onTap?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(menuItems.length, (index) {
          final item = menuItems[index];
          final hasDropdown =
              item.dropdownItems != null && item.dropdownItems!.isNotEmpty;

          return _NavButton(
            key: navKeys[index],
            title: item.title,
            isOpen: activeIndex == index,
            showArrow: hasDropdown,
            onTap: () => _onNavTap(context, navKeys[index], item, index),
          );
        }),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final bool isOpen;
  final bool showArrow;
  final VoidCallback onTap;

  const _NavButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isOpen,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Responsive.isTabDesk(context)
                  ? SizedBox(
                    width: 70,
                    child: Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: isOpen ? Colors.green : null,
                          fontWeight:
                              isOpen ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                  : Text(
                    title,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: isOpen ? Colors.green : null,
                      fontWeight: isOpen ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
              if (showArrow)
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
