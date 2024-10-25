// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCUNYwRSundlnOZ6r2wn23noY2rGEWzH6o',
    appId: '1:564117399673:web:5b7a80c506b3cad1bd4ca8',
    messagingSenderId: '564117399673',
    projectId: 'chat-app-ff306',
    authDomain: 'chat-app-ff306.firebaseapp.com',
    storageBucket: 'chat-app-ff306.appspot.com',
    measurementId: 'G-XVZLJX7VYV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ3ZMC1LAMFXxPIqPdhlBDTmtptTJT6l0',
    appId: '1:564117399673:android:ac3b5d34a4cc5538bd4ca8',
    messagingSenderId: '564117399673',
    projectId: 'chat-app-ff306',
    storageBucket: 'chat-app-ff306.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCB0TZnu5-G_sFv12TKUUgR1ssC5ZG3v6U',
    appId: '1:564117399673:ios:233da97da245800dbd4ca8',
    messagingSenderId: '564117399673',
    projectId: 'chat-app-ff306',
    storageBucket: 'chat-app-ff306.appspot.com',
    iosBundleId: 'com.example.chatApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCB0TZnu5-G_sFv12TKUUgR1ssC5ZG3v6U',
    appId: '1:564117399673:ios:233da97da245800dbd4ca8',
    messagingSenderId: '564117399673',
    projectId: 'chat-app-ff306',
    storageBucket: 'chat-app-ff306.appspot.com',
    iosBundleId: 'com.example.chatApp1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUNYwRSundlnOZ6r2wn23noY2rGEWzH6o',
    appId: '1:564117399673:web:c2be2f290af5fcc1bd4ca8',
    messagingSenderId: '564117399673',
    projectId: 'chat-app-ff306',
    authDomain: 'chat-app-ff306.firebaseapp.com',
    storageBucket: 'chat-app-ff306.appspot.com',
    measurementId: 'G-LG2CGY7QJC',
  );
}