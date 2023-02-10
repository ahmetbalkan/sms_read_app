import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_read_app/repository/firebase_repo.dart';
import 'package:telephony/telephony.dart';

import '../../../main.dart';

part 'sms_state.dart';

class SmsCubit extends Cubit<SmsState> {
  FirebaseRepository firebaseRepository;
  SmsCubit({required this.firebaseRepository})
      : super(PermissionState(smsStatus: SmsStatus.permfalse));

  final Telephony telephony = Telephony.instance;

  listenAddSms() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.body);
        firebaseRepository.saveSms(message);
      },
      listenInBackground: false,
    );
  }

  getPermission() async {
    var permission = await Permission.sms.status;
    if (permission == PermissionStatus.denied) {
      permission = await Permission.sms.request();
      if (permission == PermissionStatus.granted) {
        emit(PermissionState(smsStatus: SmsStatus.permtrue));
      } else {
        emit(PermissionState(smsStatus: SmsStatus.permfalse));
      }
    }
    if (permission == PermissionStatus.granted) {
      var permission = await Permission.sms.status;
      emit(PermissionState(smsStatus: SmsStatus.permtrue));
    }
    if (permission == PermissionStatus.permanentlyDenied) {
      emit(PermissionState(smsStatus: SmsStatus.permpermanently));
    }
  }
}
