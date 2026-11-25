import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/widgets/custom_text_field.dart';

class CompanyTextField extends StatelessWidget {
  const CompanyTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.hintText,
  });

  final String text;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 0.01.h),
          CustomTextField(
            hintText: hintText,
            controller: controller,
          ),
        ],
      ),
    );
  }
}