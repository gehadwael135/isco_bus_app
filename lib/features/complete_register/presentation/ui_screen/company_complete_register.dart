import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/ui_screen/bottom_navigation_view.dart';
import 'package:isco_bus/features/complete_register/presentation/component/column_widget.dart';
import 'package:isco_bus/features/complete_register/presentation/component/company_text_field.dart';
import 'package:isco_bus/features/complete_register/presentation/controller/cubit/complete_register_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CompanyCompleteRegister extends StatefulWidget {
  const CompanyCompleteRegister({super.key});

  @override
  State<CompanyCompleteRegister> createState() =>
      _CompanyCompleteRegisterState();
}

class _CompanyCompleteRegisterState extends State<CompanyCompleteRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController headquartersController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    headquartersController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteRegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<CompleteRegisterCubit, CompleteRegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<CompleteRegisterCubit>();
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
                            "assets/images/Union (2).png",
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
                              SizedBox(height: 0.015.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.05.w),
                                child: GradientText(
                                  'Complete Registration',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
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
                                child: Text(
                                  "Make sure that all Information on the previous page is correct",
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                              SizedBox(height: 0.03.h),
                              CompanyTextField(
                                text: "Company Name",
                                controller: nameController,
                                hintText: "Enter Company Name",
                              ),
                              SizedBox(height: 0.015.h),
                              CompanyTextField(
                                text: "Company Headquarters",
                                controller: headquartersController,
                                hintText: "Enter Company Headquarters",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.015.h),
                    CompanyTextField(
                      text: "City",
                      controller: cityController,
                      hintText: "Enter City",
                    ),
                    SizedBox(height: 0.015.h),
                    CompanyTextField(
                      text: "Address in Detail",
                      controller: addressController,
                      hintText: "Enter Address in Detail",
                    ),
                    SizedBox(height: 0.025.h),
                    ColumnWidget(
                      image: cubit.cardImageCompany != null
                          ? File(cubit.cardImageCompany!.path)
                          : null,
                      uploadOnTap: () {
                        cubit.pickImagCardCampany();
                      },
                      registerOnTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigationView(),
                            ),
                          );
                        }
                      },
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