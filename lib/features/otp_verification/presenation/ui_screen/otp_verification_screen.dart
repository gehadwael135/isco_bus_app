import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/core/widgets/static_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    super.dispose();
  }

  Widget _buildOtpBox(TextEditingController controller) {
    return CustomTextField(
      horizontal: 0.01.w,
      height: (0.07.h).clamp(46.0, 62.0),
      width: (0.17.w).clamp(52.0, 84.0),
      hintText: "-",
      maxLength: 1,
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 0.03.h),
              child: Column(
                children: [
                  SizedBox(height: 0.02.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.03.w),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.06.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.06.w),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "OTP Verification",
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: (0.06.w).clamp(20.0, 26.0),
                          color: AppColors.lightTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.02.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.06.w),
                    child: Text(
                      "Please check your email www.iscobus@gmail.com\n to see the verification code",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdGray,
                        fontSize: (0.036.w).clamp(12.5, 15.5),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.052.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                        child: Text(
                          "OTP Code",
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 0.012.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.04.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildOtpBox(otpController1),
                            _buildOtpBox(otpController2),
                            _buildOtpBox(otpController3),
                            _buildOtpBox(otpController4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.04.h),
                  GrediantButton(
                    width: 0.9.w,
                    height: (0.07.h).clamp(48.0, 60.0),
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    borderRadius: 16,
                    onTap: () {},
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Verify",
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextButton(
                            onPressed: () {},
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Resend code to",
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.thirdGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "01:26",
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.thirdGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.08.w),
                    child: staticText(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}