
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_text_styles.dart';


class AppTheme {
  AppTheme._();

  
  // LIGHT THEME
  
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // ==========================================================
    // Color Scheme

    colorScheme: ColorScheme.light(
      primary: AppColors.brightRed,
      onPrimary: AppColors.white,

      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
secondaryContainer: AppColors.darkGray,
      error: AppColors.error,
      onPrimaryContainer: AppColors.thirdGray.withOpacity(0.2),

      surface: AppColors.white,
      onSurface: AppColors.darkBlack,

      outline: AppColors.secondaryGray,
    ),

    // ==========================================================
    // Scaffold
    scaffoldBackgroundColor: AppColors.white,

    // ==========================================================
    // AppBar
    
    appBarTheme: AppBarTheme(
      
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      elevation: 3,
      centerTitle: true,
      toolbarHeight: AppSizes.appBarHeight,

      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),

      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: AppSizes.iconM,
      ),
    ),

    // ==========================================================
    // Text
    
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,

      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,

      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,

      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,

      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),

    // ==========================================================
    // Elevated Button
   
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: AppColors.white,

        minimumSize: const Size(
          double.infinity,
          AppSizes.buttonHeight,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusM,
          ),
        ),

        elevation: 0,

        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ==========================================================
    // Text Button
    
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.transparent,

        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.black
        ),
      ),
    ),

    // ==========================================================
    // Input Fields
   
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingM,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.secondaryGray,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.secondaryGray,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryRed,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 2,
        ),
      ),

      labelStyle: const TextStyle(
        color: AppColors.secondaryGray,
      ),

      hintStyle: const TextStyle(
        color: AppColors.secondaryGray,
      ),

      prefixIconColor: AppColors.secondaryGray,
      suffixIconColor: AppColors.secondaryGray,
    ),

    // ==========================================================
    // Card
    
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 3,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusS,
        ),
      ),
    ),

    // ==========================================================
    // Divider
    
    dividerTheme: const DividerThemeData(
      color: AppColors.secondaryGray,
      thickness: 1,
      space: 1,
    ),

    // ==========================================================
    // Icon
    
    iconTheme: const IconThemeData(
      color: AppColors.black,
      size: AppSizes.iconM,
    ),

    // ==========================================================
    // Navigation Bar
    
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,

      indicatorColor: AppColors.secondary,

      elevation: 3,

      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    ),

    // ==========================================================
    // Bottom Navigation Bar
   
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryRed,
      unselectedItemColor: AppColors.secondaryGray,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    // ==========================================================
    // Dialog
    
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.white,
      elevation: 8,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),

      titleTextStyle: AppTextStyles.titleLarge,
      contentTextStyle: AppTextStyles.bodyMedium,
    ),

    // ==========================================================
    // Bottom Sheet
    
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
      elevation: 8,
      showDragHandle: true,
    ),

    // ==========================================================
    // SnackBar
    
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkBlack,

      contentTextStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 14,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
      ),

      behavior: SnackBarBehavior.floating,
    ),

    // ==========================================================
    // Drawer
    
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.white,
    ),
  );

  // ============================================================
  // DARK THEME
  
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    // ==========================================================
    // Color Scheme
    
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,

      secondary: AppColors.secondary,
      onSecondary: AppColors.white,

      error: AppColors.error,
      onError: AppColors.white,

      surface: AppColors.darkBlack,
      onSurface: AppColors.white,

      outline: AppColors.secondaryGray,
    ),

    // ==========================================================
    // Scaffold
  
    scaffoldBackgroundColor: AppColors.dark,

    // ==========================================================
    // AppBar
    
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlack,
      foregroundColor: AppColors.white,
      elevation: 3,
      centerTitle: true,

      toolbarHeight: AppSizes.appBarHeight,

      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),

      iconTheme: IconThemeData(
        color: AppColors.white,
        size: AppSizes.iconM,
      ),
    ),

    // ==========================================================
    // Text
    
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(
        color: AppColors.white,
      ),

      displayMedium: AppTextStyles.displayMedium.copyWith(
        color: AppColors.white,
      ),

      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.white,
      ),

      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.white,
      ),

      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.white,
      ),

      titleLarge: AppTextStyles.titleLarge.copyWith(
        color: AppColors.white,
      ),

      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: AppColors.white,
      ),

      titleSmall: AppTextStyles.titleSmall.copyWith(
        color: AppColors.white,
      ),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.white,
      ),

      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.secondaryGray,
      ),

      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.secondaryGray,
      ),
    ),

    // ==========================================================
    // Input Fields
   
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkBlack,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingM,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.secondaryGray,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryRed,
          width: 2,
        ),
      ),

      hintStyle: const TextStyle(
        color: AppColors.secondaryGray,
      ),

      labelStyle: const TextStyle(
        color: AppColors.secondaryGray,
      ),
    ),

    // ==========================================================
    // Card
    
    cardTheme: CardThemeData(
      color: AppColors.darkBlack,
      elevation: 2,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
      ),
    ),

    // ==========================================================
    // Icon
    
    iconTheme: const IconThemeData(
      color: AppColors.white,
      size: AppSizes.iconM,
    ),

    // ==========================================================
    // Navigation Bar
   
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColors.darkBlack,
      indicatorColor: AppColors.primary,
      elevation: 3,
    ),

    // ==========================================================
    // Bottom Navigation
   
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBlack,
      selectedItemColor: AppColors.primaryRed,
      unselectedItemColor: AppColors.secondaryGray,
      elevation: 8,
    ),

    // ==========================================================
    // Tab Bar
    
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.primaryRed,
      unselectedLabelColor: AppColors.secondaryGray,
      indicatorColor: AppColors.primaryRed,
    ),

    // ==========================================================
    // Dialog
    
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkBlack,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
    ),

    // ==========================================================
    // Bottom Sheet
    
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkBlack,
      showDragHandle: true,
    ),

    // ==========================================================
    // SnackBar
    
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.black,

      behavior: SnackBarBehavior.floating,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
      ),
    ),


    // ==========================================================
    // Drawer
    
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBlack,
    ),
  );
}
