import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Main landing-page heading
  static const TextStyle heading = TextStyle(
    fontSize: 54,
    fontWeight: FontWeight.w700,
    color: AppColor.heading,
    height: 1.15,
    letterSpacing: -0.8,
  );

  // Section heading
  static const TextStyle heading2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColor.heading,
    height: 1.2,
  );

  // Smaller section heading
  static const TextStyle subheading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColor.heading,
    height: 1.3,
  );

  // Card title
  static const TextStyle title = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: AppColor.heading,
    height: 1.3,
  );

  // Introductory paragraph
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColor.bodyText,
    height: 1.7,
  );

  // Regular paragraph
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.bodyText,
    height: 1.7,
  );

  // Card descriptions and supporting text
  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.bodyText,
    height: 1.6,
  );

  // Labels such as ABOUT US and OUR MISSION
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.primary,
    letterSpacing: 2,
    height: 1.5,
  );

  // Wisdom / Wellness / Community labels
  static const TextStyle bulletLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColor.primary,
    letterSpacing: 1.5,
    height: 1.5,
  );

  // Navigation
  static const TextStyle navButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.bodyText,
    height: 1.4,
  );

  static const TextStyle navButtonActive = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.primary,
    height: 1.4,
  );

  // Button text — color comes from the button's foregroundColor
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // Explore / Learn more links
  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.primary,
    height: 1.5,
  );

  // Tagline
  static const TextStyle tagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColor.bodyText,
    height: 1.5,
  );
}
