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
    apiKey: 'AIzaSyC42SzZRxB9MiG0WnV4WXY-JPdYVmzXvZU',
    appId: '1:586699569492:web:05854eea6b7e8864ff70c1',
    messagingSenderId: '586699569492',
    projectId: 'proyectoapp-ec81c',
    authDomain: 'proyectoapp-ec81c.firebaseapp.com',
    storageBucket: 'proyectoapp-ec81c.firebasestorage.app',
    measurementId: 'G-SVSE3G4VJ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjcCQYYD18Gw0CGYqZyHRgHjBPrbE7jrI',
    appId: '1:586699569492:android:0bb91d64b5c281b9ff70c1',
    messagingSenderId: '586699569492',
    projectId: 'proyectoapp-ec81c',
    storageBucket: 'proyectoapp-ec81c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7gCdur2KAiflxFGbK97KR_l6Bghg65N0',
    appId: '1:586699569492:ios:aaa8565aafeb8656ff70c1',
    messagingSenderId: '586699569492',
    projectId: 'proyectoapp-ec81c',
    storageBucket: 'proyectoapp-ec81c.firebasestorage.app',
    iosBundleId: 'com.example.vega',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7gCdur2KAiflxFGbK97KR_l6Bghg65N0',
    appId: '1:586699569492:ios:aaa8565aafeb8656ff70c1',
    messagingSenderId: '586699569492',
    projectId: 'proyectoapp-ec81c',
    storageBucket: 'proyectoapp-ec81c.firebasestorage.app',
    iosBundleId: 'com.example.vega',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC42SzZRxB9MiG0WnV4WXY-JPdYVmzXvZU',
    appId: '1:586699569492:web:1dea4cf249945fc0ff70c1',
    messagingSenderId: '586699569492',
    projectId: 'proyectoapp-ec81c',
    authDomain: 'proyectoapp-ec81c.firebaseapp.com',
    storageBucket: 'proyectoapp-ec81c.firebasestorage.app',
    measurementId: 'G-KRESVKTS4F',
  );
}
