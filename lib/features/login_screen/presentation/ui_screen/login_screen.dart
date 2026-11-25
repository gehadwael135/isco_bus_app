import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';
import 'package:isco_bus/core/widgets/small_container.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/ui_screen/bottom_navigation_view.dart';
import 'package:isco_bus/features/choose_type_account_for_register/presentation/ui_screen/choose_type_account.dart';
import 'package:isco_bus/features/forget_password/presentation/ui_screen/forget_password_screen.dart';
import 'package:isco_bus/features/login_screen/presentation/controller/cubit/login_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<LoginCubit>();
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 0.04.h),
                child: Stack(
                  children: [
                  
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        height: 0.5.h,
                        child: Image.asset(
                          "assets/images/Union.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SafeArea(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: Column(
                            children: [
                              
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 0.015.h,
                                  left: 0.03.w,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios),
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.03.h),

                              
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.06.w),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: GradientText(
                                    'Login here',
                                    textAlign: TextAlign.center,
                                    style: textTheme.displayLarge,
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ltr,
                                    radius: 0.4,
                                    colors: [
                                      AppColors.brightRed,
                                      AppColors.primary,
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.02.h),

                             
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.06.w),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Welcome back you’ve \nbeen missed!",
                                    textAlign: TextAlign.center,
                                    style: textTheme.displayLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (0.06.w).clamp(20.0, 26.0),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.045.h),

                             
                              CustomTextField(
                                hintText:
                                    "Enter Email, Username or Phone Number",
                                controller: emailController,
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

                              SizedBox(height: 0.022.h),

                            
                              CustomTextField(
                                hintText: 'Enter Your Password',
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
                                    cubit.changeScure();
                                  },
                                  icon: cubit.isScure
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                        ),
                                ),
                                controller: passwordController,
                                obscureText: !cubit.isScure,
                              ),

                             
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.04.w),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forgot your password?",
                                      style: textTheme.bodyLarge!.copyWith(
                                        color: AppColors.primaryLightRed,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.025.h),

                              
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 0.03.w),
                                child: GrediantButton(
                                  width: 0.9.w,
                                  height: (0.068.h).clamp(48.0, 60.0),
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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavigationView(),
                                        ),
                                      );
                                    }
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Sign in",
                                      style: textTheme.titleLarge!.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.03.h),

                              
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChooseTypeAccount(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Create new account",
                                  style: textTheme.bodyLarge!.copyWith(
                                    color: AppColors.secondaryGray,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              SizedBox(height: 0.025.h),

                              Text(
                                "Or continue with",
                                style: textTheme.titleMedium!.copyWith(
                                  color: AppColors.primaryLightRed,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: 0.03.h),

                             
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallContainer(
                                    onTap: () {},
                                    width: (0.18.w).clamp(56.0, 80.0),
                                    height: (0.06.h).clamp(44.0, 56.0),
                                    child: const Icon(
                                      Icons.g_mobiledata_rounded,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(width: 0.035.w),
                                  SmallContainer(
                                    onTap: () {},
                                    width: (0.18.w).clamp(56.0, 80.0),
                                    height: (0.06.h).clamp(44.0, 56.0),
                                    child: const Icon(
                                      Icons.facebook,
                                      size: 25,
                                    ),
                                  ),
                                  SizedBox(width: 0.035.w),
                                  SmallContainer(
                                    onTap: () {},
                                    width: (0.18.w).clamp(56.0, 80.0),
                                    height: (0.06.h).clamp(44.0, 56.0),
                                    child: const Icon(
                                      Icons.apple,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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