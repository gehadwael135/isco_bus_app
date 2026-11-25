import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_glow_border/gradient_glow_border.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/core/widgets/static_widget.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    super.key,
    required this.uploadOnTap,
    required this.registerOnTap,
    this.image,
  });

  final void Function() uploadOnTap;
  final void Function() registerOnTap;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Image of the Card",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 0.015.h),
          InkWell(
            onTap: uploadOnTap,
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 0.22.h,
              width: double.infinity,
              child: GradientGlowBorder.dashed(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                colors: [AppColors.brightRed, AppColors.primary],
                animationDuration: const Duration(seconds: 2),
                thickness: 3,
                spacing: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: image != null
                      ? Image.file(
                          image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Group 7.png",
                                width: 0.1.w,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 0.01.h),
                              Text(
                                "Upload",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.thirdGray),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: 0.04.h),
          GrediantButton(
            onTap: registerOnTap,
            width: double.infinity,
            height: 0.068.h,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkBlack,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 7),
              ),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            borderRadius: 16,
            child: Text(
              "Register",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: 0.03.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.03.w),
            child: staticText(context),
          ),
          SizedBox(height: 0.04.h),
        ],
      ),
    );
  }
}