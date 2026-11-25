import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';

class RideHistoryCard extends StatelessWidget {
  final String rideId;
  final String busName;
  final String date;
  final String statusText;
  final Color statusColor;
  final String busImage;
  final VoidCallback? onTap;

  const RideHistoryCard({
    super.key,
    required this.rideId,
    required this.busName,
    required this.date,
    required this.statusText,
    required this.statusColor,
    required this.busImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidth = (0.14.w).clamp(48.0, 74.0);
    final imageHeight = (0.06.h).clamp(42.0, 62.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 0.018.h),
        padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.015.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ride ID: $rideId',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: (0.032.w).clamp(11.5, 14.0),
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0.02.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.03.w,
                    vertical: 0.008.h,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      statusText,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (0.03.w).clamp(10.5, 13.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.012.h),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    busImage,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: imageWidth,
                      height: imageHeight,
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.directions_bus,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0.035.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        busName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (0.04.w).clamp(14.0, 17.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 0.004.h),
                      Text(
                        date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (0.032.w).clamp(11.5, 14.0),
                          fontWeight: FontWeight.w500,
                          color: date.toLowerCase() == 'today'
                              ? Colors.red
                              : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}