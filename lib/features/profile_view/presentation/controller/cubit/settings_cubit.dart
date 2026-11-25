import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool pushNotification = false;
  bool location = true;
  String selectedLanguage = 'English (US)';

  void togglePushNotification(bool value) {
    pushNotification = value;
    emit(SettingsPushNotification());
  }

  void toggleLocation(bool value) {
    location = value;
    emit(SettingsLocation());
  }

  void changeLanguage(String lang) {
    selectedLanguage = lang;
    emit(SettingsLanguage());
  }

  final List<Map<String, dynamic>> helpCategories = [
    {
      'icon': Icons.grid_view_rounded,
      'color': Colors.blue,
      'title': 'General',
      'subtitle': 'Basic question about Restate',
      'onTap': () {
        print("General");
      },
    },
    {
      'icon': Icons.monetization_on_outlined,
      'color': Colors.orange,
      'title': 'Packages',
      'subtitle': 'All you need to know about selling your home to Restate',
      'onTap': () {
        print("Packages");
      },
    },
    {
      'icon': Icons.account_balance_wallet_outlined,
      'color': Colors.redAccent,
      'title': 'Wallet',
      'subtitle': 'Everything you need to know about buying with Restate',
      'onTap': () {
        print("wallet");
      },
    },
    {
      'icon': Icons.person_outline_rounded,
      'color': Colors.lightBlue,
      'title': 'Agents',
      'subtitle': 'How buying agents and listing agents can work with Restate',
      'onTap': () {
        print("agents");
      },
    },
  ];

  final List<Map<String, dynamic>> ridesList = [
    {
      'rideId': '888333777',
      'busName': 'Iscobus Red',
      'date': 'Today',
      'statusText': 'Is Complete',
      'statusColor': const Color(0xFFB71C1C),
      'busImage': 'assets/images/ايسكوووباص 2.png',
    },
    {
      'rideId': '518333268',
      'busName': 'Iscobus Gold',
      'date': 'Tuesday/2/2025',
      'statusText': 'Is Complete',
      'statusColor': const Color(0xFFC5A059),
      'busImage': 'assets/images/pposa 2.png',
    },
    {
      'rideId': '208333214',
      'busName': 'Iscobus Gray',
      'date': 'Monday/2/2025',
      'statusText': 'Is Complete',
      'statusColor': Colors.grey.shade500,
      'busImage': 'assets/images/lkkfa 2.png',
    },
    {
      'rideId': '548333551',
      'busName': 'Iscobus Red',
      'date': 'Sunday/2/2025',
      'statusText': 'Is Complete',
      'statusColor': const Color(0xFFB71C1C),
      'busImage': 'assets/images/ايسكوووباص 2.png',
    },
    {
      'rideId': '328333214',
      'busName': 'Iscobus Gold',
      'date': 'Thursday/2/2025',
      'statusText': 'Is Complete',
      'statusColor': const Color(0xFFC5A059),
      'busImage': 'assets/images/pposa 2.png',
    },
  ];

  String? selectedDeleteReason;

  void selectDeleteReason(String reason) {
    selectedDeleteReason = reason;
    emit(SettingsLanguageChangedState());
  }
}
