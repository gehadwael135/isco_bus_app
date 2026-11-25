import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/features/onboarding/presentation/ui_screen/onboarding_screen.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
void initState() {
  super.initState();

  Future.delayed(
    const Duration(seconds: 4),
    () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .infinity,
        height: .infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primarysplash, AppColors.black],
            begin: .topCenter,
            end: .bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,

          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/IS 1.png',
                width: 0.8.w,
                height: 0.6.h,
              ),
            ),

            Center(
              child: Image.asset(
                'assets/images/ISCOBUS 1.png',
                width: 0.45.w,
                height: 0.23.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
