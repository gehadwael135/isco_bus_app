part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class SettingsPushNotification extends SettingsState {}
final class SettingsLocation extends SettingsState {}
final class SettingsLanguage extends SettingsState {}
final class SettingsLanguageChangedState extends SettingsState {}
