import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/features/profile_view/presentation/component/custom_gradient_switch.dart';
import 'package:isco_bus/features/profile_view/presentation/component/setting_component.dart';
import 'package:isco_bus/features/profile_view/presentation/controller/cubit/settings_cubit.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final outlineColor = Theme.of(context).colorScheme.outline;

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<SettingsCubit>();
            return SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 0.04.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.02.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.03.w),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: (0.045.w).clamp(16.0, 22.0),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Settings",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (0.042.w).clamp(15.0, 19.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: (0.11.w).clamp(40.0, 56.0)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.06.w,
                            right: 0.06.w,
                            top: 0.03.h,
                            bottom: 0.01.h,
                          ),
                          child: Text(
                            "PROFILE",
                            style: textTheme.bodySmall!.copyWith(
                              color: outlineColor,
                              fontWeight: FontWeight.w600,
                              fontSize: (0.032.w).clamp(11.5, 14.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.05.w,
                            vertical: 0.015.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Push Notification",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: (0.04.w).clamp(14.5, 18.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 0.03.w),
                              CustomGradientSwitch(
                                value: cubit.pushNotification,
                                onChanged: (value) {
                                  cubit.togglePushNotification(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.05.w,
                            vertical: 0.015.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Location",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: (0.04.w).clamp(14.5, 18.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 0.03.w),
                              CustomGradientSwitch(
                                value: cubit.location,
                                onChanged: (value) {
                                  cubit.toggleLocation(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        SettingComponent(
                          title: "Language",
                          trailing: cubit.selectedLanguage.split(' ').first,
                          onTap: () => showLanguageSheet(context, cubit),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.06.w,
                            right: 0.06.w,
                            top: 0.03.h,
                            bottom: 0.01.h,
                          ),
                          child: Text(
                            "OTHER",
                            style: textTheme.bodySmall!.copyWith(
                              color: outlineColor,
                              fontWeight: FontWeight.w600,
                              fontSize: (0.032.w).clamp(11.5, 14.0),
                            ),
                          ),
                        ),
                        SettingComponent(
                          title: "About Iscobus",
                          onTap: () {
                            showGlassPopup(
                              context,
                              title: "About Iscobus",
                              content:
                                  "Isco Bus Company is an Egyptian joint stock company that owns many brands, its old name is isco Travel and it has been working in the field of transporting liquids and students to public transportation since 2014.Isco Bus Company is one of the best private sector companies working in the field of public transportation under the Ministry of Transportation.Isco Bus Company provides technical development solutions using information technology and controlling light materials and students transportation services throughout the year, and is distinguished by its services to users to simplify their lives, and thus in transportation an oasis in delivery.",
                            );
                          },
                        ),
                        SettingComponent(
                          title: "Privacy Policy",
                          onTap: () {
                            showGlassPopup(
                              context,
                              title: "Privacy Policy",
                              content:
                                  "An app privacy policy is a legal document that discloses how your app collects, uses, stores, and shares user’s data. This data may include names, email addresses, phone numbers, IP addresses, payment information, and even behavioural data. Whether your app is for iOS, Android, or the web, you must clearly communicate your data practices to comply with legal requirements and maintain user trust.",
                            );
                          },
                        ),
                        SettingComponent(
                          title: "Terms and Conditions",
                          onTap: () {
                            showGlassPopup(
                              context,
                              title: "Terms and Conditions",
                              content:
                                  "Terms of service are the legal agreements between service providers and the service consumers. The person must agree to abide by the terms of service in order to use the offered service. Terms of service can also be merely a disclaimer, especially regarding the use of websites.",
                            );
                          },
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

  void showGlassPopup(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      showDragHandle: false,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: GlassifyWidget(
          width: double.infinity,
          height: (0.48.h).clamp(320.0, 520.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.012.h),
                Center(
                  child: Container(
                    width: (0.12.w).clamp(40.0, 64.0),
                    height: (0.006.h).clamp(4.0, 7.0),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 0.02.h),
                Text(
                  title,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: (0.04.w).clamp(14.5, 18.0),
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 0.015.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: double.infinity,
                      child: GlassifyWidget(
                        child: Padding(
                          padding: EdgeInsets.all(0.03.w),
                          child: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: (0.034.w).clamp(12.0, 15.0),
                              height: 1.45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.02.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLanguageSheet(BuildContext context, SettingsCubit cubit) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      showDragHandle: false,
      enableDrag: false,
      isDismissible: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: GlassifyWidget(
                width: double.infinity,
                height: (0.45.h).clamp(310.0, 480.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.012.h),
                      Center(
                        child: Container(
                          width: (0.15.w).clamp(48.0, 76.0),
                          height: (0.006.h).clamp(4.0, 7.0),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.02.h),
                      Text(
                        "Select Language",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: (0.04.w).clamp(14.5, 18.0),
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 0.025.h),
                      languageTile(context, cubit, "English (US)", "🇺🇸"),
                      SizedBox(height: 0.015.h),
                      languageTile(context, cubit, "Arabic (EG)", "🇪🇬"),
                      const Spacer(),
                      GrediantButton(
                        width: double.infinity,
                        height: (0.07.h).clamp(48.0, 60.0),
                        onTap: () => Navigator.pop(context),
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        borderRadius: 30,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Select",
                            style: textTheme.titleMedium!.copyWith(
                              color: AppColors.white,
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

  Widget languageTile(
    BuildContext context,
    SettingsCubit cubit,
    String language,
    String flag,
  ) {
    final selected = cubit.selectedLanguage == language;
    final avatarRadius = (0.04.w).clamp(13.0, 18.0);

    return GlassifyWidget(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.02.w),
        leading: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.white,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              flag,
              style: TextStyle(fontSize: (0.036.w).clamp(13.0, 16.0)),
            ),
          ),
        ),
        title: Text(
          language,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontSize: (0.034.w).clamp(12.0, 15.0),
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: selected
            ? const Icon(Icons.check_circle, color: Colors.red, size: 20)
            : null,
        onTap: () => cubit.changeLanguage(language),
      ),
    );
  }
}