part of 'sms_cubit.dart';

@immutable
abstract class SmsState {}

class SmsLoadingState extends SmsState {}

class SmsListenState extends SmsState {}

class PermissionState extends SmsState {
  final SmsStatus smsStatus;
  PermissionState({required this.smsStatus});
}

enum SmsStatus {
  permtrue,
  permfalse,
  permpermanently,
}
