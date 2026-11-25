import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isco_bus/features/Home/presentation/ui_screen/home_screen.dart';
import 'package:isco_bus/features/profile_view/presentation/ui/profile_view_screen.dart';
import 'package:isco_bus/features/qr_view/presentation/ui/qr_view_screen.dart';
import 'package:isco_bus/features/wallet_view/presentation/ui/wallet_view_screen.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
 final List<Widget> pages =  [
    SizedBox() , 
    WalletViewScreen(),
    HomeScreen(),
    QrViewScreen(),
    ProfileViewScreen(),
  ];


   void changeIndex(int index) {
    emit(BottomNavigationInitial(
      currentIndex: index,
      isDrawerOpen: false,
    ));
  }

  void openDrawer() {
    emit(BottomNavigationInitial(
      currentIndex:state.currentIndex,
      isDrawerOpen: true,
    ));
  }

  void closeDrawer() {
    emit(BottomNavigationInitial(
      currentIndex: state.currentIndex,
      isDrawerOpen: false,
    ));
  }

  void toggleDrawer() {
    if (state.isDrawerOpen) {
      closeDrawer();
    } else {
      openDrawer();
    }
  }

}
