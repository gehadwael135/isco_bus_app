import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onTap,
    this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.passwordIcon,
    this.height,
    this.keyboardType,
    this.width, this.horizontal, this.maxLength,
  });
  final Widget? labelText;
  final String hintText;
  final IconData? icon;
  final Function()? onTap;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? passwordIcon;
  final double? height;
  final double? width;
  final double? horizontal;
  final TextInputType? keyboardType;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:horizontal?? 0.05.w),
      child: SizedBox(
       
        width: width,
        child: TextFormField(
          cursorColor: AppColors.darkBlack,
          keyboardType: keyboardType,
          maxLength:maxLength ,
           buildCounter: (
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    return null;
  },
          cursorWidth: 1.5,
          obscuringCharacter: "*",
          obscureText: obscureText,
          controller: controller,
          onTap: onTap,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            prefixIcon: Icon(icon, size: 20, color: AppColors.secondaryGray),
            prefixIconConstraints: const BoxConstraints(minWidth: 10),
            label: labelText,
            hint: Text(
              hintText,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.darkGray),
            ),
constraints: BoxConstraints(
  minHeight: height ?? 0.06.h,
),
            filled: true,
            fillColor: AppColors.lightGray,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.secondaryGray,
              ),
              borderRadius: BorderRadius.circular(12),
            ),errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error),
              borderRadius: BorderRadius.circular(12),
            ) ,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBlack),
              borderRadius: BorderRadius.circular(12),
            ),

            suffixIcon: passwordIcon,
          ),
        ),
      ),
    );
  }
}
