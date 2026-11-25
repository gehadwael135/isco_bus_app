import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/features/onboarding/presentation/components/build_onboarding_item.dart';
import 'package:isco_bus/features/onboarding/presentation/controller/cubit/page_view_cubit.dart';
import 'package:isco_bus/features/onboarding/presentation/domain/entities/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: Scaffold(
        extendBody: true,
        body: BlocConsumer<PageViewCubit, PageViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            return PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) =>
                  buildOnboardingItem(context, index, pageController),
            );
          },
        ),
      ),
    );
  }
}