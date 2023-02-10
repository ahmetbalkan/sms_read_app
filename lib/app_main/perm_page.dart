import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_read_app/app_main/app_main.dart';

import 'state/sms_cubit/sms_cubit.dart';

class PermPage extends StatefulWidget {
  const PermPage({super.key});

  @override
  State<PermPage> createState() => _PermPageState();
}

class _PermPageState extends State<PermPage> {
  @override
  void initState() {
    context.read<SmsCubit>().getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SmsCubit, SmsState>(
        listener: (context, state) {
          if (state is PermissionState) {
            if (state.smsStatus == SmsStatus.permtrue) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppMain(),
                  ));
            }

            if (state.smsStatus == SmsStatus.permpermanently) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("İzin vermediniz Lütfen izin veriniz."),
                  ElevatedButton(
                    onPressed: () async {
                      await openAppSettings();
                    },
                    child: const Text(
                      "İzin ver",
                    ),
                  ),
                ],
              )));
            }
          }
        },
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text("Lütfen izin veriniz"),
            ElevatedButton(
              onPressed: () {
                context.read<SmsCubit>().getPermission();
              },
              child: const Text(
                "İzin Ver",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
