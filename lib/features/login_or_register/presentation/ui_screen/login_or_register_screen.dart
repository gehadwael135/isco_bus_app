import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/glassify_widget.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/features/choose_type_account_for_register/presentation/ui_screen/choose_type_account.dart';
import 'package:isco_bus/features/login_screen/presentation/ui_screen/login_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.08.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.06.w),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: GradientText(
                  'Discover Your \nDream Trips here',
                  textAlign: TextAlign.center,
                  style: textTheme.displayLarge,
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 0.4,
                  colors: const [
                    Color.fromARGB(255, 95, 94, 94),
                    Color(0xff000000),
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.025.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.06.w),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Where Journeys Begin, Adventures Unfold, and \nMemories Last Forever.",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 0.02.h),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/باص-700 2.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Positioned(
                    bottom: 0.05.h,
                    left: 0.06.w,
                    right: 0.06.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: GrediantButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            width: 0.38.w,
                            height: 0.065.h,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Login",
                                style: textTheme.titleLarge!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 0.06.w),
                        Flexible(
                          child: GlassifyWidget(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChooseTypeAccount(),
                                ),
                              );
                            },
                            width: 0.38.w,
                            height: 0.065.h,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Register",
                                style: textTheme.titleLarge!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
}