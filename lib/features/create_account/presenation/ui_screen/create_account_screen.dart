import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/core/widgets/small_container.dart';
import 'package:isco_bus/features/complete_register/presentation/ui_screen/company_complete_register.dart';
import 'package:isco_bus/features/complete_register/presentation/ui_screen/complete_register_screen.dart';
import 'package:isco_bus/features/create_account/presenation/controller/cubit/create_account_cubit.dart';
import 'package:isco_bus/features/login_screen/presentation/ui_screen/login_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key, required this.accountType});
  final String accountType;

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(),
      child: Scaffold(
        body: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<CreateAccountCubit>();
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 0.48.h,
                          child: Image.asset(
                            "assets/images/Union (1).png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SafeArea(
                          bottom: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 0.03.w,
                                    top: 0.01.h,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios),
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.005.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.05.w),
                                child: GradientText(
                                  'Create Account',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  gradientType: GradientType.linear,
                                  gradientDirection: GradientDirection.ltr,
                                  radius: 0.4,
                                  colors: [
                                    AppColors.brightRed,
                                    AppColors.primary,
                                  ],
                                ),
                              ),
                              SizedBox(height: 0.01.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.08.w),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    children: [
                                      const TextSpan(
                                        text: 'You are now the reason for a ',
                                      ),
                                      TextSpan(
                                        text: widget.accountType.trim(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color: AppColors.brightRed,
                                            ),
                                      ),
                                      const TextSpan(
                                        text:
                                            ' account\n on the iscobus application ',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.02.h),
                              Center(
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius: 0.12.w,
                                        backgroundImage:
                                            cubit.profileImage != null
                                                ? FileImage(
                                                    File(
                                                      cubit.profileImage!.path,
                                                    ),
                                                  )
                                                : const AssetImage(
                                                    "assets/images/OIP.png",
                                                  ) as ImageProvider,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cubit.pickImageProfile();
                                      },
                                      child: CircleAvatar(
                                        radius: 0.042.w,
                                        backgroundColor:
                                            AppColors.primaryLightRed,
                                        child: Icon(
                                          Icons.edit,
                                          size: 0.045.w,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0.025.h),
                              CustomTextField(
                                horizontal: 0.08.w,
                                hintText: "User Name",
                                controller: userNameController,
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(height: 0.02.h),
                              CustomTextField(
                                horizontal: 0.08.w,
                                hintText: 'Email',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Email is required";
                                  }
                                  final emailRegex = RegExp(
                                    r'^[\w\.-]+@[\w\.-]+\.\w+$',
                                  );
                                  if (!emailRegex.hasMatch(value.trim())) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.02.h),
                    CustomTextField(
                      horizontal: 0.08.w,
                      hintText: 'Phone Number',
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Phone number is required";
                        }
                        if (value.length < 11) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 0.02.h),
                    CustomTextField(
                      horizontal: 0.08.w,
                      hintText: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        if (value.length != 8) {
                          return "Password must be 8 characters";
                        }
                        return null;
                      },
                      passwordIcon: IconButton(
                        onPressed: () {
                          cubit.changeScurePassword();
                        },
                        icon: cubit.isScure
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                      obscureText: !cubit.isScure,
                    ),
                    SizedBox(height: 0.02.h),
                    CustomTextField(
                      horizontal: 0.08.w,
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm password is required";
                        }
                        if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      passwordIcon: IconButton(
                        onPressed: () {
                          cubit.changeScureConfirmPassword();
                        },
                        icon: cubit.isScure2
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                      obscureText: !cubit.isScure2,
                    ),
                    SizedBox(height: 0.04.h),
                    GrediantButton(
                      width: 0.84.w,
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
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final type = widget.accountType.trim();
                          if (type == "Student") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CompleteRegisterScreen(
                                  accountType: "Student",
                                ),
                              ),
                            );
                          } else if (type == "Doctor University") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CompleteRegisterScreen(
                                  accountType: "Doctor University",
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CompanyCompleteRegister(),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Next",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(height: 0.02.h),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Already have an account",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.secondaryGray,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    SizedBox(height: 0.005.h),
                    Text(
                      "Or continue with",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.primaryLightRed,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(height: 0.02.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallContainer(
                          onTap: () {},
                          width: 0.18.w,
                          height: 0.06.h,
                          child: const Icon(Icons.g_mobiledata_rounded, size: 35),
                        ),
                        SizedBox(width: 0.04.w),
                        SmallContainer(
                          onTap: () {},
                          width: 0.18.w,
                          height: 0.06.h,
                          child: const Icon(Icons.facebook, size: 25),
                        ),
                        SizedBox(width: 0.04.w),
                        SmallContainer(
                          onTap: () {},
                          width: 0.18.w,
                          height: 0.06.h,
                          child: const Icon(Icons.apple, size: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.04.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}