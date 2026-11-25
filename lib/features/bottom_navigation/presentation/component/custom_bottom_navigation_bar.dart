import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final ValueChanged<int> onItemTap;

  @override
  Widget build(BuildContext context) {
    final isHomeTab = currentIndex == 2;

    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 13),
      height: 0.08.h,
      decoration: !isHomeTab
          ? BoxDecoration(
              color: Colors.white.withOpacity(
                0.85,
              ), 
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.withOpacity(0.25), 
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.12,
                  ),
                  blurRadius: 18,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
            )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GlassifyWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildItem(icon: Icons.menu_rounded, index: 0, context: context),
                buildItem(
                  icon: Icons.account_balance_wallet,
                  index: 1,
                  context: context,
                ),
                buildItem(icon: Icons.home_rounded, index: 2, context: context),
                buildItem(icon: Icons.qr_code_2, index: 3, context: context),
                buildItem(
                  icon: Icons.person_outline_rounded,
                  index: 4,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem({
    required IconData icon,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = currentIndex == index;
    final isHomeMode = currentIndex == 2;

    return GestureDetector(
      onTap: () => onItemTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 58,
        height: 42,
        decoration: BoxDecoration(
          gradient: (isSelected && isHomeMode)
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.onSurface,
                    Theme.of(context).colorScheme.secondaryContainer,
                  ],
                )
              : null,
          color: (isSelected && !isHomeMode) ? Colors.white : null,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? isHomeMode
                    ? [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.surface,
                          blurRadius: 2,
                          spreadRadius: 0.05,
                          offset: const Offset(1, 0),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ]
              : null,
        ),
        child: Icon(
          icon,
          color: isHomeMode ? Colors.white : Colors.black87,
          size: isSelected ? 26 : 22,
        ),
      ),
    );
  }
}
