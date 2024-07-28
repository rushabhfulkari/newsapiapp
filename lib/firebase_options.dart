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
    apiKey: 'AIzaSyCM5feoPZVmbpshaiLh-umAcbiDgpvucaI',
    appId: '1:834351086945:web:97b19c309f9c64aef11920',
    messagingSenderId: '834351086945',
    projectId: 'newsapiappmynews',
    authDomain: 'newsapiappmynews.firebaseapp.com',
    storageBucket: 'newsapiappmynews.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHPFDyF37vr0v3uQ0Re3geVlWzkRmGJS4',
    appId: '1:834351086945:android:ab08f19c51365a3ef11920',
    messagingSenderId: '834351086945',
    projectId: 'newsapiappmynews',
    storageBucket: 'newsapiappmynews.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCugq9p7w8C8clVIGwGIUj8-bLpzQU-I7Y',
    appId: '1:834351086945:ios:7b73c49a54d72bb8f11920',
    messagingSenderId: '834351086945',
    projectId: 'newsapiappmynews',
    storageBucket: 'newsapiappmynews.appspot.com',
    iosBundleId: 'com.rush.newsapiapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCugq9p7w8C8clVIGwGIUj8-bLpzQU-I7Y',
    appId: '1:834351086945:ios:7b73c49a54d72bb8f11920',
    messagingSenderId: '834351086945',
    projectId: 'newsapiappmynews',
    storageBucket: 'newsapiappmynews.appspot.com',
    iosBundleId: 'com.rush.newsapiapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCM5feoPZVmbpshaiLh-umAcbiDgpvucaI',
    appId: '1:834351086945:web:142dce0ae845b924f11920',
    messagingSenderId: '834351086945',
    projectId: 'newsapiappmynews',
    authDomain: 'newsapiappmynews.firebaseapp.com',
    storageBucket: 'newsapiappmynews.appspot.com',
  );
}
