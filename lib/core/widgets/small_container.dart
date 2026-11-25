import 'package:flutter/material.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child, required this.onTap,
  });
  final double width;
  final double height;
  final Widget child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray,
        ),
        child: child,
      ),
    );
  }
}
