import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/features/profile_view/presentation/component/person_data_widget.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController currentPasswordcontroller =
      TextEditingController();
  final TextEditingController newPasswordcontroller = TextEditingController();
  final TextEditingController confirmPasswordcontroller =
      TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    datecontroller.dispose();
    gendercontroller.dispose();
    phonecontroller.dispose();
    emailcontroller.dispose();
    currentPasswordcontroller.dispose();
    newPasswordcontroller.dispose();
    confirmPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final avatarRadius = (0.095.w).clamp(32.0, 46.0);
    final badgeRadius = (0.035.w).clamp(11.0, 16.0);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 0.04.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.015.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.03.w),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: (0.05.w).clamp(18.0, 24.0),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Personal Date",
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
                  SizedBox(height: 0.02.h),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: const AssetImage("assets/images/OIP.png"),
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
                  SizedBox(height: 0.02.h),
                  PersonDataWidget(
                    text: "Full Name",
                    controller: namecontroller,
                    hintText: "Gehad Wael",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Date of birth",
                    controller: datecontroller,
                    hintText: "15/01/2005",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Gender",
                    controller: gendercontroller,
                    hintText: "Female",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Phone",
                    controller: phonecontroller,
                    hintText: "+20 100 197 8380",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Email",
                    controller: emailcontroller,
                    hintText: "bgamaal590@gmail.com",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Change Password",
                    controller: currentPasswordcontroller,
                    hintText: "Current Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 0.015.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                    child: CustomTextField(
                      hintText: "New Password",
                      controller: newPasswordcontroller,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 0.015.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                    child: CustomTextField(
                      hintText: "Confirm Password",
                      controller: confirmPasswordcontroller,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 0.04.h),
                  GrediantButton(
                    width: 0.9.w,
                    height: (0.07.h).clamp(48.0, 60.0),
                    onTap: () {},
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    borderRadius: 30,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Save",
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
        ),
      ),
    );
  }
}