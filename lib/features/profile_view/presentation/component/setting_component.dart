import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';

class SettingComponent extends StatelessWidget {
  const SettingComponent({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final outlineColor = Theme.of(context).colorScheme.outline;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.w, vertical: 0.02.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: (0.04.w).clamp(14.5, 18.0),
                ),
              ),
            ),
            SizedBox(width: 0.03.w),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailing != null) ...[
                  Text(
                    trailing!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium!.copyWith(
                      color: outlineColor,
                      fontSize: (0.035.w).clamp(12.5, 15.5),
                    ),
                  ),
                  SizedBox(width: 0.015.w),
                ],
                Icon(
                  Icons.arrow_forward_ios,
                  size: (0.038.w).clamp(14.0, 18.0),
                  color: outlineColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}