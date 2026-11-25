import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/features/profile_view/presentation/component/ride_history_card.dart';
import 'package:isco_bus/features/profile_view/presentation/controller/cubit/settings_cubit.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({super.key});

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
            'My Ride',
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
                      children: [
                        SizedBox(height: 0.01.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Total Ride: ${cubit.ridesList.length}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: (0.035.w).clamp(12.5, 15.5),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 0.03.w),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Time out: 20',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: (0.035.w).clamp(12.5, 15.5),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.02.h),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.ridesList.length,
                            itemBuilder: (context, index) {
                              final ride = cubit.ridesList[index];
                              return RideHistoryCard(
                                rideId: ride['rideId'],
                                busName: ride['busName'],
                                date: ride['date'],
                                statusText: ride['statusText'],
                                statusColor: ride['statusColor'],
                                busImage: ride['busImage'],
                                onTap: () {},
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