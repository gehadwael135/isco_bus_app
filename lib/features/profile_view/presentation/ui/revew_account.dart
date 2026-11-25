import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/features/profile_view/presentation/component/person_data_widget.dart';

class RevewAccount extends StatefulWidget {
  const RevewAccount({super.key});

  @override
  State<RevewAccount> createState() => _RevewAccountState();
}

class _RevewAccountState extends State<RevewAccount> {
  final TextEditingController namecontroller1 = TextEditingController();
  final TextEditingController datecontroller1 = TextEditingController();
  final TextEditingController gendercontroller1 = TextEditingController();
  final TextEditingController phonecontroller1 = TextEditingController();
  final TextEditingController emailcontroller1 = TextEditingController();
  final TextEditingController unicontroller1 = TextEditingController();
  final TextEditingController faccontroller1 = TextEditingController();
  final TextEditingController acadimcontroller1 = TextEditingController();
  final TextEditingController citycontroller1 = TextEditingController();
  final TextEditingController linecontroller1 = TextEditingController();
  final TextEditingController streetcontroller1 = TextEditingController();

  @override
  void dispose() {
    namecontroller1.dispose();
    datecontroller1.dispose();
    gendercontroller1.dispose();
    phonecontroller1.dispose();
    emailcontroller1.dispose();
    unicontroller1.dispose();
    faccontroller1.dispose();
    acadimcontroller1.dispose();
    citycontroller1.dispose();
    linecontroller1.dispose();
    streetcontroller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final avatarRadius = (0.095.w).clamp(32.0, 46.0);

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
                              "Revew Account",
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
                  CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage: const AssetImage("assets/images/OIP.png"),
                  ),
                  SizedBox(height: 0.02.h),
                  PersonDataWidget(
                    text: "Full Name",
                    controller: namecontroller1,
                    hintText: "Gehad Wael",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Date of birth",
                    controller: datecontroller1,
                    hintText: "15/01/2005",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Gender",
                    controller: gendercontroller1,
                    hintText: "Female",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Phone",
                    controller: phonecontroller1,
                    hintText: "+20 100 197 8380",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Email",
                    controller: emailcontroller1,
                    hintText: "bgamaal590@gmail.com",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "University",
                    controller: unicontroller1,
                    hintText: "Zagazig National University",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Faculty",
                    controller: faccontroller1,
                    hintText: "Computers and Informatics Aviation",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Academic Year",
                    controller: acadimcontroller1,
                    hintText: "2",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "City",
                    controller: citycontroller1,
                    hintText: "Mit Ghamr",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Line",
                    controller: linecontroller1,
                    hintText: "1",
                  ),
                  SizedBox(height: 0.012.h),
                  PersonDataWidget(
                    text: "Street",
                    controller: streetcontroller1,
                    hintText: "Daqdos street",
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