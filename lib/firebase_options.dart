// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD0ZBOe9xLTdp2Sc1wGS9q6V0iH0TWkyxk',
    appId: '1:482866487893:web:996934c79aab326c23aadc',
    messagingSenderId: '482866487893',
    projectId: 'smsreadapp',
    authDomain: 'smsreadapp.firebaseapp.com',
    storageBucket: 'smsreadapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb6uLiEMKpgBwMJRR_fVzQ2fbsKpR3TL4',
    appId: '1:482866487893:android:fb64ed9e6a50114623aadc',
    messagingSenderId: '482866487893',
    projectId: 'smsreadapp',
    storageBucket: 'smsreadapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqW2xjE_bsUcMcM02S_N-EF55J6_By2bA',
    appId: '1:482866487893:ios:0154cdf8ec711f8423aadc',
    messagingSenderId: '482866487893',
    projectId: 'smsreadapp',
    storageBucket: 'smsreadapp.appspot.com',
    androidClientId: '482866487893-eojq0cpbn272c1it6ln1q762h0pe2ijh.apps.googleusercontent.com',
    iosClientId: '482866487893-4upvl346btbj2q3rksmdif95jomsv9ob.apps.googleusercontent.com',
    iosBundleId: 'com.example.smsReadApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqW2xjE_bsUcMcM02S_N-EF55J6_By2bA',
    appId: '1:482866487893:ios:0154cdf8ec711f8423aadc',
    messagingSenderId: '482866487893',
    projectId: 'smsreadapp',
    storageBucket: 'smsreadapp.appspot.com',
    androidClientId: '482866487893-eojq0cpbn272c1it6ln1q762h0pe2ijh.apps.googleusercontent.com',
    iosClientId: '482866487893-4upvl346btbj2q3rksmdif95jomsv9ob.apps.googleusercontent.com',
    iosBundleId: 'com.example.smsReadApp',
  );
}