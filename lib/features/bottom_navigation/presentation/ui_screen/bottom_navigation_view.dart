import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/component/custom_bottom_navigation_bar.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/component/custom_drawer.dart';
import 'package:isco_bus/features/bottom_navigation/presentation/controller/cubit/bottom_navigation_cubit.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<BottomNavigationCubit>();

          return Scaffold(
            body: Stack(
              children: [
                
               
                Positioned.fill(
                  child: IndexedStack(
                    index: state.currentIndex,
                    children: cubit.pages,
                  ),
                ),



                
                Positioned(
                left: 0.03.w,
            right: 0.03.w,
            bottom: 0.01.h,
                  child:
                   CustomBottomNavigationBar(
                    currentIndex: state.currentIndex,
                    onItemTap: (index) {
                      if (index == 0) {
                        cubit.toggleDrawer();
                      } else {
                        cubit.changeIndex(index);
                      }
                    },
                  ),
                ),
                if (state.isDrawerOpen) ...[

  Positioned.fill(
    child: GestureDetector(
      onTap: cubit.closeDrawer,
      child: Container(
        color: Colors.black54,
      ),
    ),
  ),

 
  Positioned(
    top: 0,
    bottom: 0,
    left: 0,
    child: CustomDrawer(
       selectedIndex: state.currentIndex,
      onClose: cubit.closeDrawer,
      onItemTap: (index) {
        cubit.changeIndex(index);
      },
    ),
  ),
],
              ],
            ),
          );
        },
      ),
    );
  }
}
