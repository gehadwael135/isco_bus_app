import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final ValueChanged<int> onItemTap;
  final int selectedIndex;

  const CustomDrawer({
    super.key,
    required this.onClose,
    required this.onItemTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final drawerWidth = (0.75.w).clamp(245.0, 360.0);
    final headerCardWidth = (drawerWidth - (0.08.w)).clamp(210.0, 320.0);
    final avatarRadius = (0.06.w).clamp(20.0, 30.0);
    final callCardWidth = (drawerWidth - (0.10.w)).clamp(200.0, 310.0);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: drawerWidth),
      child: SizedBox(
        width: drawerWidth,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: GlassifyWidget(
            blurSigma: 5.7,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.03.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.015.h),
                    Center(
                      child: SizedBox(
                        width: headerCardWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: GlassifyWidget(
                            blurSigma: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.03.w,
                                vertical: 0.012.h,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: avatarRadius,
                                    backgroundImage: const AssetImage(
                                      'assets/images/OIP.png',
                                    ),
                                  ),
                                  SizedBox(width: 0.03.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Abdelrhman Gamal',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: (0.04.w)
                                                .clamp(14.0, 18.0),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 0.003.h),
                                        Text(
                                          'Student',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: const Color(0xff3B3B3B),
                                            fontSize: (0.032.w)
                                                .clamp(11.5, 14.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.025.h),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          _DrawerItem(
                            icon: Icons.home,
                            title: 'Home',
                            onTap: () => onItemTap(2),
                            itemIndex: 2,
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.map_outlined,
                            title: 'Drive Map',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.add_box_outlined,
                            title: 'Request Line',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.qr_code_2,
                            title: 'My QR Code',
                            onTap: () => onItemTap(3),
                            itemIndex: 3,
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.card_membership,
                            title: 'My Packages',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.directions_bus_outlined,
                            title: 'Trips',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.account_balance_wallet_outlined,
                            title: 'My Wallet',
                            onTap: () => onItemTap(1),
                            itemIndex: 1,
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.local_offer_outlined,
                            title: 'Cashback',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.location_city_outlined,
                            title: 'Request City',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.language,
                            title: 'Change Language',
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                          _DrawerItem(
                            icon: Icons.help_outline,
                            title: "FAQ'S",
                            onTap: () {},
                            selectedIndex: selectedIndex,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.015.h),
                    Center(
                      child: Container(
                        width: callCardWidth,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.035.w,
                          vertical: 0.012.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.forum_outlined,
                              color: Colors.white,
                              size: (0.055.w).clamp(19.0, 25.0),
                            ),
                            SizedBox(width: 0.03.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Call Us',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: (0.036.w).clamp(13.0, 16.0),
                                    ),
                                  ),
                                  Text(
                                    'Call & Whatsapp',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: (0.028.w).clamp(10.0, 12.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 0.02.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white60,
                              size: (0.036.w).clamp(13.0, 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.01.h,
                        horizontal: 0.03.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.wb_sunny,
                                  color: AppColors.white,
                                  size: (0.045.w).clamp(16.0, 21.0),
                                ),
                                SizedBox(width: 0.015.w),
                                Flexible(
                                  child: Text(
                                    'Light',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: (0.034.w).clamp(12.0, 15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 0.08.w),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.nightlight,
                                  color: Colors.white60,
                                  size: (0.045.w).clamp(16.0, 21.0),
                                ),
                                SizedBox(width: 0.015.w),
                                Flexible(
                                  child: Text(
                                    'Dark',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: (0.034.w).clamp(12.0, 15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.02.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final int? itemIndex;
  final int selectedIndex;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.itemIndex,
    this.selectedIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = itemIndex != null && itemIndex == selectedIndex;

    final Widget drawerItem = ListTile(
      dense: true,
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0.03.w,
      ),
      leading: Icon(
        icon,
        color: AppColors.white,
        size: (0.055.w).clamp(19.0, 25.0),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColors.white,
          fontSize: (0.036.w).clamp(13.0, 16.0),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.02.w,
        vertical: 0.002.h,
      ),
      child: isSelected
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GlassifyWidget(
                blurSigma: 11,
                child: drawerItem,
              ),
            )
          : drawerItem,
    );
  }
}