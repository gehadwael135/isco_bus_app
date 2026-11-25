import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/features/login_or_register/presentation/ui_screen/login_or_register_screen.dart';
import 'package:isco_bus/features/onboarding/presentation/components/custom_TextButton.dart';
import 'package:isco_bus/features/onboarding/presentation/components/custom_button.dart';
import 'package:isco_bus/features/onboarding/presentation/domain/entities/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildOnboardingItem(
  BuildContext context,
  int index,
  PageController pageController,
) {
  final item = onboardingData[index];
  final textTheme = Theme.of(context).textTheme;

  return SafeArea(
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.w),
          child: Column(
            children: [
              SizedBox(height: 0.015.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index == 0
                      ? const SizedBox(width: 60)
                      : CustomTextbutton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          text: "Previous",
                        ),
                  CustomTextbutton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginOrRegisterScreen(),
                        ),
                      );
                    },
                    text: "Skip",
                  ),
                ],
              ),
              SizedBox(height: 0.02.h),
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 0.02.h),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: textTheme.displaySmall?.copyWith(
                        fontSize: (0.072.w).clamp(24.0, 32.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.secondTitle,
                          style: textTheme.displaySmall?.copyWith(
                            fontSize: (0.072.w).clamp(24.0, 32.0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 0.015.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item.highlightedText,
                              style: textTheme.displaySmall?.copyWith(
                                fontSize: (0.072.w).clamp(24.0, 32.0),
                                fontWeight: FontWeight.bold,
                                color: item.color,
                              ),
                            ),
                            SizedBox(height: 0.004.h),
                            Image.asset(
                              item.underlineImage,
                              width: item.underlineImageSize.w,
                              height: 0.018.h,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.015.h),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.03.w),
                  child: Text(
                    item.description,
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.secondaryGray,
                      fontSize: (0.038.w).clamp(13.0, 16.0),
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 0.02.h),
              SmoothPageIndicator(
                controller: pageController,
                count: onboardingData.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.blueGrey[55] ?? Colors.grey.shade300,
                  activeDotColor: index == onboardingData.length - 1
                      ? AppColors.black
                      : item.color,
                  dotHeight: (0.012.h).clamp(8.0, 11.0),
                  expansionFactor: 4,
                  dotWidth: (0.012.h).clamp(8.0, 11.0),
                  spacing: 0.012.w,
                ),
              ),
              SizedBox(height: 0.025.h),
              SizedBox(
                width: 0.78.w,
                height: (0.062.h).clamp(44.0, 56.0),
                child: CustomButton(
                  onPressed: () {
                    if (index == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginOrRegisterScreen(),
                        ),
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  color: onboardingData[index].color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      index == 0 ? "Get Started" : "Next",
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.035.h),
            ],
          ),
        ),
      ),
    ),
  );
}