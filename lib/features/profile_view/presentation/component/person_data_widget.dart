import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';

class PersonDataWidget extends StatelessWidget {
  const PersonDataWidget({
    super.key,
    required this.text,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  });

  final String text;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.w),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              maxLines: 1,
              style: textTheme.titleMedium!.copyWith(
                fontSize: (0.042.w).clamp(14.0, 18.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 0.01.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.w),
          child: CustomTextField(
            hintText: hintText,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}