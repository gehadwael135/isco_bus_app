import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/core/widgets/static_widget.dart';
import 'package:isco_bus/features/otp_verification/presenation/ui_screen/otp_verification_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 0.22.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0.07.h,
                      left: 0.04.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Forgot password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.lightTextColor,
                    ),
              ),
              SizedBox(height: 0.02.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.08.w),
                child: Text(
                  "Enter your email account to reset \n your password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdGray,
                      ),
                ),
              ),
              SizedBox(height: 0.05.h),
              CustomTextField(
                horizontal: 0.05.w,
                hintText: "Enter Email, Username or Phone Number",
                controller: controller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email, username or phone number";
                  }

                  final input = value.trim();
                  final emailRegex = RegExp(
                    r'^[\w\.-]+@[\w\.-]+\.\w+$',
                  );
                  final phoneRegex = RegExp(
                    r'^\+?\d{10,15}$',
                  );
                  final usernameRegex = RegExp(
                    r'^[a-zA-Z0-9_]{3,30}$',
                  );

                  if (emailRegex.hasMatch(input) ||
                      phoneRegex.hasMatch(input) ||
                      usernameRegex.hasMatch(input)) {
                    return null;
                  }

                  return "Enter a valid email, username or phone number";
                },
              ),
              SizedBox(height: 0.06.h),
              Center(
                child: GrediantButton(
                  width: 0.9.w,
                  height: 0.07.h,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  borderRadius: 16,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      staticDialoge(context);

                      await Future.delayed(
                        const Duration(seconds: 3),
                      );

                      if (!context.mounted) return;

                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Reset Password",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(height: 0.15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.08.w),
                child: staticText(context),
              ),
              SizedBox(height: 0.05.h),
            ],
          ),
        ),
      ),
    );
  }
}