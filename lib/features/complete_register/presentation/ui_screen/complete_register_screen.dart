import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/ui_screen/bottom_navigation_view.dart';
import 'package:isco_bus/features/complete_register/presentation/component/column_widget.dart';
import 'package:isco_bus/features/complete_register/presentation/component/dropdown_widget.dart';
import 'package:isco_bus/features/complete_register/presentation/controller/cubit/complete_register_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key, required this.accountType});
  final String accountType;

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  final TextEditingController universityController = TextEditingController();
  final ValueNotifier<String?> selectedUniversity = ValueNotifier(null);
  final ValueNotifier<String?> selectedFaculty = ValueNotifier(null);
  final ValueNotifier<String?> selectedAcademicYear = ValueNotifier(null);
  final ValueNotifier<String?> selectedCitiy = ValueNotifier(null);
  final ValueNotifier<String?> selectedLine = ValueNotifier(null);
  final ValueNotifier<String?> selectedStreet = ValueNotifier(null);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    universityController.dispose();
    selectedUniversity.dispose();
    selectedFaculty.dispose();
    selectedAcademicYear.dispose();
    selectedCitiy.dispose();
    selectedLine.dispose();
    selectedStreet.dispose();
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
                              DropdownWidget(
                                text: "University",
                                hint: "Enter University",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a university";
                                  }
                                  return null;
                                },
                                dropdownItems: cubit.universities,
                                valueListenable: selectedUniversity,
                                onChanged: (value) {
                                  selectedUniversity.value = value;
                                },
                                dropdownWidth: 0.9.w,
                                buttonWidth: double.infinity,
                                buttonHeight: 0.065.h,
                              ),
                              SizedBox(height: 0.015.h),
                              DropdownWidget(
                                text: "Faculty",
                                hint: "Enter Faculty of specific Education",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a Faculty";
                                  }
                                  return null;
                                },
                                dropdownItems: cubit.faculties,
                                valueListenable: selectedFaculty,
                                onChanged: (value) {
                                  selectedFaculty.value = value;
                                },
                                dropdownWidth: 0.9.w,
                                buttonWidth: double.infinity,
                                buttonHeight: 0.065.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.015.h),
                    if (widget.accountType == "Doctor University") ...[
                      DropdownWidget(
                        text: "Academic Year",
                        hint: "Enter Academic Year",
                        dropdownItems: cubit.academicYears,
                        valueListenable: selectedAcademicYear,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a Academic Year";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          selectedAcademicYear.value = value;
                        },
                        dropdownWidth: 0.9.w,
                        buttonWidth: double.infinity,
                        buttonHeight: 0.065.h,
                      ),
                      SizedBox(height: 0.015.h),
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DropdownWidget(
                            text: "City",
                            hint: "Enter City",
                            dropdownItems: cubit.cities,
                            valueListenable: selectedCitiy,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a City";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedCitiy.value = value;
                            },
                            dropdownWidth: 0.42.w,
                            dropdownHeight: 0.2.h,
                            buttonWidth: double.infinity,
                            buttonHeight: 0.062.h,
                          ),
                        ),
                        Expanded(
                          child: DropdownWidget(
                            text: "Line",
                            hint: "Enter Line",
                            dropdownItems: cubit.lines,
                            valueListenable: selectedLine,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a Line";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedLine.value = value;
                            },
                            dropdownWidth: 0.42.w,
                            dropdownHeight: 0.2.h,
                            buttonWidth: double.infinity,
                            buttonHeight: 0.062.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.015.h),
                    DropdownWidget(
                      text: "Street",
                      hint: "Enter Street or Route",
                      dropdownItems: cubit.streets,
                      valueListenable: selectedStreet,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a Street";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        selectedStreet.value = value;
                      },
                      dropdownWidth: 0.9.w,
                      buttonWidth: double.infinity,
                      buttonHeight: 0.065.h,
                    ),
                    SizedBox(height: 0.02.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Gender",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 0.02.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.selectedGender();
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 0.08.w,
                                      backgroundColor: cubit.selected_1
                                          ? AppColors.primaryLightRed
                                          : AppColors.lightGray,
                                      child: Image.asset(
                                        "assets/images/Oval.png",
                                        width: 0.09.w,
                                      ),
                                    ),
                                    SizedBox(height: 0.01.h),
                                    GradientText(
                                      'Male',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 0.4,
                                      colors: cubit.selected_1
                                          ? [
                                              AppColors.brightRed,
                                              AppColors.primary,
                                            ]
                                          : [
                                              AppColors.black,
                                              AppColors.thirdGray,
                                            ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.selectedGender2();
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 0.08.w,
                                      backgroundColor: cubit.selected_2
                                          ? AppColors.primaryLightRed
                                          : AppColors.lightGray,
                                      child: Image.asset(
                                        "assets/images/Oval (1).png",
                                        width: 0.09.w,
                                      ),
                                    ),
                                    SizedBox(height: 0.01.h),
                                    GradientText(
                                      'Female',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 0.4,
                                      colors: cubit.selected_2
                                          ? [
                                              AppColors.brightRed,
                                              AppColors.primary,
                                            ]
                                          : [
                                              AppColors.black,
                                              AppColors.thirdGray,
                                            ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.025.h),
                        ],
                      ),
                    ),
                    ColumnWidget(
                      image: cubit.cardImage != null
                          ? File(cubit.cardImage!.path)
                          : null,
                      uploadOnTap: () {
                        cubit.pickImagCard();
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