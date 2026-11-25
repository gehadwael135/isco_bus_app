import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/features/profile_view/presentation/component/Row_of_setting.dart';
import 'package:isco_bus/features/profile_view/presentation/controller/cubit/settings_cubit.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/help_center.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/my_rides_screen.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/personal_data.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/revew_account.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/setting.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final outlineColor = Theme.of(context).colorScheme.outline;
    final avatarRadius = (0.095.w).clamp(32.0, 46.0);
    final badgeRadius = (0.035.w).clamp(11.0, 16.0);

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor: AppColors.lightGray,
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<SettingsCubit>();
            return SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 0.11.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.025.h),
                        Text(
                          "Profile Settings",
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: (0.042.w).clamp(15.0, 19.0),
                          ),
                        ),
                        SizedBox(height: 0.015.h),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: avatarRadius,
                              backgroundImage:
                                  const AssetImage("assets/images/OIP.png"),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: badgeRadius,
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: (badgeRadius * 1.35).clamp(15.0, 22.0),
                                    color: AppColors.primaryLightRed,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.014.h),
                        Text(
                          "Gehad Wael",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: (0.042.w).clamp(15.0, 19.0),
                          ),
                        ),
                        SizedBox(height: 0.003.h),
                        Text(
                          "bgamaal590@gmail.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall!.copyWith(
                            color: outlineColor,
                            fontSize: (0.032.w).clamp(11.5, 14.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.05.w,
                            vertical: 0.018.h,
                          ),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.035.w,
                                vertical: 0.012.h,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My Ride",
                                        style: textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: (0.04.w).clamp(14.5, 18.0),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyRidesScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "See All",
                                          style: textTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: (0.038.w).clamp(13.5, 17.0),
                                            color: AppColors.primaryLightRed,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Ride ID",
                                        style: textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: outlineColor,
                                          fontSize: (0.035.w).clamp(12.5, 15.5),
                                        ),
                                      ),
                                      SizedBox(width: 0.015.w),
                                      Flexible(
                                        child: Text(
                                          "888333777",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: (0.035.w).clamp(12.5, 15.5),
                                          ),
                                        ),
                                      ),
                                      
                                     Spacer(flex: 2,),
                                      GrediantButton(
                                        width: (0.24.w).clamp(84.0, 125.0),
                                        height: (0.035.h).clamp(26.0, 36.0),
                                        borderRadius: 30,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        onTap: () {},
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "In Complete",
                                            maxLines: 1,
                                            style: textTheme.bodySmall!.copyWith(
                                              color: AppColors.white,
                                              fontSize: (0.03.w).clamp(10.5, 13.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                  SizedBox(height: 0.015.h),
                                  Divider(
                                    color: AppColors.secondaryGray,
                                    thickness: 0.5,
                                  ),
                                  SizedBox(height: 0.01.h),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/ايسكوووباص 1.png",
                                          width: (0.2.w).clamp(64.0, 96.0),
                                          height: (0.085.h).clamp(54.0, 78.0),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 0.04.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Iscobus Red",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: (0.038.w)
                                                        .clamp(13.5, 16.5),
                                                  ),
                                            ),
                                            SizedBox(height: 0.004.h),
                                            Text(
                                              "Tuesday/2/2025",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: (0.034.w)
                                                        .clamp(12.0, 15.0),
                                                    color:
                                                        AppColors.primaryLightRed,
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
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.06.w,
                                vertical: 0.01.h,
                              ),
                              child: Text(
                                "Profile",
                                style: textTheme.bodySmall!.copyWith(
                                  color: outlineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: (0.032.w).clamp(11.5, 14.0),
                                ),
                              ),
                            ),
                            RowOfSetting(
                              icon: Icons.person_pin_circle_outlined,
                              text: "Personal Data",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PersonalData(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 0.01.h),
                            RowOfSetting(
                              icon: Icons.person_outline,
                              text: "Revew Account",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RevewAccount(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 0.01.h),
                            RowOfSetting(
                              icon: Icons.settings_outlined,
                              text: "Settings",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Setting(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 0.01.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.06.w,
                                vertical: 0.01.h,
                              ),
                              child: Text(
                                "Support",
                                style: textTheme.bodySmall!.copyWith(
                                  color: outlineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: (0.032.w).clamp(11.5, 14.0),
                                ),
                              ),
                            ),
                            RowOfSetting(
                              icon: Icons.help_center_outlined,
                              text: "Help Center",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpCenterScreen(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 0.01.h),
                            RowOfSetting(
                              icon: Icons.delete_outline,
                              text: "Account Delete",
                              onTap: () {
                                showDeleteAccountSheet(context, cubit);
                              },
                            ),
                            SizedBox(height: 0.01.h),
                            RowOfSetting(
                              icon: Icons.power_settings_new_outlined,
                              text: "Logout",
                              endicon: Icons.logout,
                              color: AppColors.brightRed,
                              onTap: () {
                                showSignOutDialog(context, cubit);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showDeleteAccountSheet(BuildContext context, SettingsCubit cubit) {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: GlassifyWidget(
                width: double.infinity,
                height: 0.82.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.012.h),
                      Center(
                        child: Container(
                          width: (0.2.w).clamp(56.0, 90.0),
                          height: (0.006.h).clamp(4.0, 7.0),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.025.h),
                      Text(
                        "Delete Account",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: (0.042.w).clamp(15.0, 19.0),
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 0.01.h),
                      Text(
                        "We're really sorry to see you go. Are you sure you want to delete your account? Once you confirm, your data will be gone.",
                        style: TextStyle(
                          fontSize: (0.032.w).clamp(11.5, 14.0),
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 0.02.h),
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            deleteReasonTile(
                              context,
                              cubit,
                              "I am no longer using my account",
                            ),
                            SizedBox(height: 0.012.h),
                            deleteReasonTile(
                              context,
                              cubit,
                              "The service is too expensive",
                            ),
                            SizedBox(height: 0.012.h),
                            deleteReasonTile(
                              context,
                              cubit,
                              "I want to change my phone number",
                            ),
                            SizedBox(height: 0.012.h),
                            deleteReasonTile(
                              context,
                              cubit,
                              "I don't understand how to use",
                            ),
                            SizedBox(height: 0.012.h),
                            deleteReasonTile(
                              context,
                              cubit,
                              "Glide is not available in my city",
                            ),
                            SizedBox(height: 0.012.h),
                            deleteReasonTile(context, cubit, "Other"),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.015.h),
                      GrediantButton(
                        width: double.infinity,
                        height: (0.065.h).clamp(46.0, 58.0),
                        onTap: () {
                          Navigator.pop(context);
                          showDeleteConfirmationDialog(context, cubit);
                        },
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        borderRadius: 30,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Delete",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.02.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget deleteReasonTile(
    BuildContext context,
    SettingsCubit cubit,
    String reason,
  ) {
    final selected = cubit.selectedDeleteReason == reason;
    return GlassifyWidget(
      height: (0.072.h).clamp(48.0, 64.0),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.035.w),
        title: Text(
          reason,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? Colors.red.shade700 : Colors.black87,
            fontSize: (0.034.w).clamp(12.0, 15.0),
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: selected
            ? const Icon(Icons.check_circle, color: Colors.red, size: 20)
            : Icon(
                Icons.circle_outlined,
                color: Colors.grey.shade400,
                size: 20,
              ),
        onTap: () => cubit.selectDeleteReason(reason),
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, SettingsCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 0.08.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GlassifyWidget(
              width: double.infinity,
              height: (0.27.h).clamp(185.0, 240.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0.05.w,
                  0.02.h,
                  0.05.w,
                  0.025.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(dialogContext),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      "Are You Sure",
                      style: TextStyle(
                        fontSize: (0.045.w).clamp(16.0, 20.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 0.012.h),
                    Text(
                      "Are You Sure Delete Account ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (0.034.w).clamp(12.0, 15.0),
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 0.03.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(dialogContext),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: GlassifyWidget(
                                height: (0.055.h).clamp(40.0, 52.0),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: (0.036.w).clamp(13.0, 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 0.035.w),
                        Expanded(
                          child: GrediantButton(
                            height: (0.055.h).clamp(40.0, 52.0),
                            onTap: () {
                              Navigator.pop(dialogContext);
                            },
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            borderRadius: 25,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: (0.036.w).clamp(13.0, 16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSignOutDialog(BuildContext context, SettingsCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 0.08.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GlassifyWidget(
              width: double.infinity,
              height: (0.27.h).clamp(185.0, 240.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0.05.w,
                  0.02.h,
                  0.05.w,
                  0.025.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(dialogContext),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: (0.045.w).clamp(16.0, 20.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 0.012.h),
                    Text(
                      "Do you want to log out ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (0.034.w).clamp(12.0, 15.0),
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 0.03.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(dialogContext),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: GlassifyWidget(
                                height: (0.055.h).clamp(40.0, 52.0),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: (0.036.w).clamp(13.0, 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 0.035.w),
                        Expanded(
                          child: GrediantButton(
                            height: (0.055.h).clamp(40.0, 52.0),
                            onTap: () {
                              Navigator.pop(dialogContext);
                            },
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            borderRadius: 25,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: (0.036.w).clamp(13.0, 16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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