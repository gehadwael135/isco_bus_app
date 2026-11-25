import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class GlassifyWidget extends StatelessWidget {
  const GlassifyWidget({
    super.key,
    required this.child,
     this.onTap,
    this.width,
    this.height,
    this.blurSigma, this.borderRadius, this.padding,
  });
  final Widget child;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final double? blurSigma;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius??BorderRadius.circular(10);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Glassify(
          blurSigma: blurSigma ?? 5.0,
          borderColor: AppColors.white,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.white, width: 0.6),
              right: BorderSide(color: AppColors.white, width: 0.6),
              top: BorderSide(color: AppColors.white, width: 0.21),
              bottom: BorderSide(color: AppColors.white, width: 0.3),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          opacity: 0.1,
          borderRadius: effectiveRadius,
          padding: const EdgeInsets.all(10),
          child: Center(child: child),
        ),
      ),
    );
  }
}
