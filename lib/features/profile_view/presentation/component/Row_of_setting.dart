import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class RowOfSetting extends StatelessWidget {
  const RowOfSetting({
    super.key,
    this.icon,
    this.endicon,
    required this.text,
    required this.onTap,
    this.color,
  });

  final IconData? icon;
  final IconData? endicon;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final boxSize = (0.09.w).clamp(32.0, 46.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.06.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.01.h),
          child: Row(
            children: [
              if (icon != null) ...[
                Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: (0.05.w).clamp(18.0, 24.0),
                    ),
                  ),
                ),
                SizedBox(width: 0.04.w),
              ],
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: (0.038.w).clamp(13.5, 16.5),
                    color: color,
                  ),
                ),
              ),
              SizedBox(width: 0.02.w),
              Icon(
                endicon ?? Icons.arrow_forward_ios,
                size: (0.045.w).clamp(16.0, 22.0),
                color: color ?? AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}