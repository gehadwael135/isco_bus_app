import 'dart:ui';

import 'package:isco_bus/core/theme/app_colors.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String secondTitle;
  final String highlightedText;
  final String description;
  final String underlineImage;
  final Color color;
  final double underlineImageSize;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.highlightedText,
    required this.description,
    required this.underlineImage,
    required this.color, required this.underlineImageSize, required this.secondTitle,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "assets/images/تصميم-الأحمر 1.png",
    title: "Select packages that",
    secondTitle:"suit your",
    highlightedText: "needs",
    description:
        "Buy the package and the number of trips suitable for the number of days youattend the university. Term payment or discount is also avaliable with Iscobus, there is no loss",
    underlineImage: "assets/images/Vector 2524.png",
    color: AppColors.primaryRed,
    underlineImageSize: 0.19 
  ),

  OnboardingModel(
    image: "assets/images/تصميم-دهبي 1.png",
    title: "More Lines, More",
    secondTitle: "",
    highlightedText: "Appointements",
    description:
        "We are always working to open manylines and points to facilitate our customers. we also care about the valueof time for our customers, and we provide multiple appointments for goingan retrning",
    underlineImage: "assets/images/Vector 2524 (1).png",
    color: AppColors.secondary,
    underlineImageSize: 0.4
  ),

  OnboardingModel(
    image: "assets/images/رمادي 1.png",
    title: "Services are waiting",
    secondTitle: "and",
    highlightedText: "tracking you",
    description:
        "Our services are always ready when you are. With our integrated live-tracking system, we stay connected with our customers every step of the way to ensure a safe and timely arrival.",
    underlineImage: "assets/images/Vector 2524 (2).png",
    color: AppColors.secondaryGray,
    underlineImageSize: 0.4
  ),
];
