part of 'bottom_navigation_cubit.dart';

@immutable
sealed class BottomNavigationState {
    final int currentIndex;
  final bool isDrawerOpen;

  const BottomNavigationState({
    this.currentIndex = 2,
    this.isDrawerOpen = false,
  });
}

final class BottomNavigationInitial extends BottomNavigationState {
   const BottomNavigationInitial({
    super.currentIndex,
    super.isDrawerOpen,
  });
}
