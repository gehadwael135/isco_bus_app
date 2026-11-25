import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

Widget staticText(BuildContext context) => RichText(
  textAlign: TextAlign.center,
  text: TextSpan(
    style: Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(color: AppColors.secondaryGray),
    children: [
      const TextSpan(text: 'By continuing, you agree to our '),
      TextSpan(
        text: 'Terms',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.darkBlack,
          fontWeight: .bold,
        ),
      ),
      const TextSpan(text: ' and '),
      TextSpan(
        text: 'Privacy Policy',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.darkBlack,
          fontWeight: .bold,
        ),
      ),
      const TextSpan(text: '.'),
    ],
  ),
);

  Future<void> staticDialoge(BuildContext context)async {
 await
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: .start,
        children: [
          SizedBox(height: 0.29.h),
          SizedBox(
            width: 0.88.w,
            height: 0.25.h,
            child: Glassify(
              blurSigma: 2.5,
              borderColor: AppColors.white,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.white, width: 0.6),
                  right: BorderSide(color: AppColors.white, width: 0.6),
                  top: BorderSide(color: AppColors.white, width: 0.21),
                  bottom: BorderSide(color: AppColors.white, width: 0.3),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              opacity: 0.1,
              borderRadius: BorderRadius.circular(15),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 0.02.h),
                    Container(
                      width: 0.12.w,
                      height: 0.052.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: LinearGradient(
                          colors: [AppColors.brightRed, AppColors.primary],
                          begin: .topCenter,
                          end: .bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.mark_email_read_outlined,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    ),

                    SizedBox(height: 0.01.h),

                    Text(
                      "Check your email",
                      textAlign: .center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: .w600,
                        fontSize: 20,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                    SizedBox(height: 0.01.h),

                    Text(
                      "We have send password recovery \ninstruction to your email",
                      textAlign: .center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: .w500,

                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
