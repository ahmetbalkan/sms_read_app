import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_read_app/repository/extention.dart';
import 'package:telephony/telephony.dart';

import 'state/sms_cubit/sms_cubit.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return const ReadSmsWidget();
  }
}

class ReadSmsWidget extends StatefulWidget {
  const ReadSmsWidget({super.key});

  @override
  State<ReadSmsWidget> createState() => _ReadSmsWidgetState();
}

final Telephony telephony = Telephony.instance;

class _ReadSmsWidgetState extends State<ReadSmsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmsCubit, SmsState>(
      builder: (context, state) {
        if (state is SmsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SmsListenState) {
          return Scaffold(
            body: Center(
                child: Text(
              "Mesajınız dinleniyor.\n Durdurmak için uygulamayı kapatabilirsiniz.",
              style: context.fontStyleLato(Colors.white, 25),
              textAlign: TextAlign.center,
            )),
          );
        } else {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mesajlarımı dinle",
                        style: context.fontStyleLato(Colors.white, 40),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                      Text(
                        "Bu buton ile mesajlarınızın dinlenmesini sağlayabilirsiniz. Bu sayede ekipler mesajlarınızı inceleyecektir.",
                        style: context.fontStyleLato(Colors.white, 19),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SmsCubit>().listenAddSms();
                        },
                        child: const Text(
                          "Mesajları Dinle",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Mesaj Dinlemenin durması için uygulamayı kapatabilirsiniz..",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ));
        }
      },
    );
  }
}
