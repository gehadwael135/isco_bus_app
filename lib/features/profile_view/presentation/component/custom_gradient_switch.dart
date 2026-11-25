import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class CustomGradientSwitch extends StatelessWidget {
  const CustomGradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final trackWidth = (0.15.w).clamp(48.0, 74.0);
    final trackHeight = (0.034.h).clamp(24.0, 36.0);
    final thumbSize = (trackHeight - 6.0).clamp(18.0, 30.0);

    return Semantics(
      toggled: value,
      button: true,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: trackWidth,
          height: trackHeight,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: value
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.brightRed, AppColors.darkBlack],
                  )
                : null,
            color: value ? null : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(trackHeight / 2),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: thumbSize,
              height: thumbSize,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}