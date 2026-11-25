import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';
import 'package:isco_bus/features/create_account/presenation/ui_screen/create_account_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChooseTypeAccount extends StatelessWidget {
  const ChooseTypeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      body: SafeArea(
        bottom: false, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.05.h), 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.06.w), 
              child: GradientText(
                'Choose the type of account you want to create on the ISCO BUS APP',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 22),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.rtl,
                radius: 0.4,
                colors: const [Color.fromARGB(255, 95, 94, 94), Color(0xff000000)],
              ),
            ),
            SizedBox(height: 0.02.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.08.w),
              child: Text(
                "Where Journeys Begin, Adventures Unfold, and\n Memories Last Forever.",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.thirdGray,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.03.h),

            
            Expanded(
              child: Stack(
                alignment: Alignment.center, 
                children: [
                 
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/busblur.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),

                 
                  Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildAccountTypeButton(
                            context,
                            title: "Student",
                            accountType: "Student",
                          ),
                          SizedBox(height: 0.028.h),
                          _buildAccountTypeButton(
                            context,
                            title: "Doctor University",
                            accountType: "Doctor University",
                          ),
                          SizedBox(height: 0.028.h),
                          _buildAccountTypeButton(
                            context,
                            title: "Company",
                            accountType: "Company",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildAccountTypeButton(
    BuildContext context, {
    required String title,
    required String accountType,
  }) {
    return GlassifyWidget(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateAccountScreen(accountType: accountType),
          ),
        );
      },
      blurSigma: 8,
      width: 0.65.w, 
      height: 0.075.h,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}