part of 'complete_register_cubit.dart';

@immutable
sealed class CompleteRegisterState {}

final class CompleteRegisterInitial extends CompleteRegisterState {}
final class SelectedGenderSuccess extends CompleteRegisterState {}
final class AddCardImageSSuccess extends CompleteRegisterState{}
