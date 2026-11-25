import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/features/profile_view/presentation/component/help_category_card.dart';
import 'package:isco_bus/features/profile_view/presentation/controller/cubit/settings_cubit.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black87,
              size: (0.05.w).clamp(18.0, 24.0),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Help Center',
            style: textTheme.titleLarge!.copyWith(
              color: Colors.black87,
              fontSize: (0.045.w).clamp(16.0, 21.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<SettingsCubit>();
            return SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.02.h),
                        Text(
                          'Hi, how we can help you?',
                          style: textTheme.titleMedium!.copyWith(
                            fontSize: (0.042.w).clamp(15.0, 18.0),
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 0.025.h),
                        SizedBox(
                          height: (0.065.h).clamp(44.0, 58.0),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(
                              fontSize: (0.036.w).clamp(13.0, 16.0),
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: (0.036.w).clamp(13.0, 16.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                                size: (0.06.w).clamp(20.0, 28.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0.012.h,
                                horizontal: 0.03.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.03.h),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.helpCategories.length,
                            itemBuilder: (context, index) {
                              final item = cubit.helpCategories[index];
                              return HelpCategoryCard(
                                icon: item['icon'],
                                iconColor: item['color'],
                                title: item['title'],
                                subtitle: item['subtitle'],
                                onTap: item['onTap'] ?? () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}