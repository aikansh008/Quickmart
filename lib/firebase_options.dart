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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0WEa5HkDYTK3ENE7LeM_6dXkpPEr0-Xs',
    appId: '1:780245953800:android:c8c2e723a0b5acce4710bd',
    messagingSenderId: '780245953800',
    projectId: 'ecommerce-aeb37',
    storageBucket: 'ecommerce-aeb37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAm3G-7Bj7_hXz6V44FuenOEtHdyfjs0k',
    appId: '1:780245953800:ios:bc9eade4d56a9f344710bd',
    messagingSenderId: '780245953800',
    projectId: 'ecommerce-aeb37',
    storageBucket: 'ecommerce-aeb37.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAAm3G-7Bj7_hXz6V44FuenOEtHdyfjs0k',
    appId: '1:780245953800:ios:bc9eade4d56a9f344710bd',
    messagingSenderId: '780245953800',
    projectId: 'ecommerce-aeb37',
    storageBucket: 'ecommerce-aeb37.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDG1-TmTIBi6KNULwKWlhbzbNulZEmNINo',
    appId: '1:780245953800:web:c83075ad504bd5e34710bd',
    messagingSenderId: '780245953800',
    projectId: 'ecommerce-aeb37',
    authDomain: 'ecommerce-aeb37.firebaseapp.com',
    storageBucket: 'ecommerce-aeb37.appspot.com',
    measurementId: 'G-GF1V72BECZ',
  );
}
