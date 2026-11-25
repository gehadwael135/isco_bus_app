import 'package:flutter/material.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class GrediantButton extends StatelessWidget {
  const GrediantButton({
    super.key,
    required this.begin,
    required this.end,
    required this.child,
    this.width,
    this.height,
    required this.onTap,
    this.boxShadow,
    this.borderRadius, this.colors,
  });
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Widget child;
  final double? width;
  final double? height;
  final void Function() onTap;
  final List<BoxShadow>? boxShadow;
  final double? borderRadius;
  final List<Color> ?colors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          gradient: LinearGradient(
            colors:colors?? [AppColors.brightRed, AppColors.primary],
            begin: begin,
            end: end,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
