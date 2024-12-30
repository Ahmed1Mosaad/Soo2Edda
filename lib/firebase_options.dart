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
    apiKey: 'AIzaSyAe15xP9QDK-TSIjn2D6Wy_-IGrFgOOd7k',
    appId: '1:603121764924:web:17f8f41a09bc7670ced139',
    messagingSenderId: '603121764924',
    projectId: 'soo2-3edda',
    authDomain: 'soo2-3edda.firebaseapp.com',
    storageBucket: 'soo2-3edda.firebasestorage.app',
    measurementId: 'G-NXWVX22YQT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLMO6iubme4oNRvRE2D6hS3W9VK9hajWU',
    appId: '1:603121764924:android:8627c6afe58b57ddced139',
    messagingSenderId: '603121764924',
    projectId: 'soo2-3edda',
    storageBucket: 'soo2-3edda.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYsOfvjubMslj9gbNQ56N2DDUPwlHCA6E',
    appId: '1:603121764924:ios:0280c9a134f37561ced139',
    messagingSenderId: '603121764924',
    projectId: 'soo2-3edda',
    storageBucket: 'soo2-3edda.firebasestorage.app',
    iosBundleId: 'com.example.soo23edda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYsOfvjubMslj9gbNQ56N2DDUPwlHCA6E',
    appId: '1:603121764924:ios:0280c9a134f37561ced139',
    messagingSenderId: '603121764924',
    projectId: 'soo2-3edda',
    storageBucket: 'soo2-3edda.firebasestorage.app',
    iosBundleId: 'com.example.soo23edda',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAe15xP9QDK-TSIjn2D6Wy_-IGrFgOOd7k',
    appId: '1:603121764924:web:2f88d3cffcd67c09ced139',
    messagingSenderId: '603121764924',
    projectId: 'soo2-3edda',
    authDomain: 'soo2-3edda.firebaseapp.com',
    storageBucket: 'soo2-3edda.firebasestorage.app',
    measurementId: 'G-QNKG1EMH6R',
  );

}