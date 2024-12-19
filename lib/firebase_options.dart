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
    apiKey: 'AIzaSyCbdGdsgrLwU5YUIopw_DG0vQHGCHw1Adk',
    appId: '1:856313149919:web:b5406c7eae506d168a6c6a',
    messagingSenderId: '856313149919',
    projectId: 'recipe-bbf6d',
    authDomain: 'recipe-bbf6d.firebaseapp.com',
    storageBucket: 'recipe-bbf6d.appspot.com',
    measurementId: 'G-NRDSBWY228',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1Qrnb_TdHHJNxHF0i_V-cjzsZoy-Momw',
    appId: '1:856313149919:android:570498eb0f17742a8a6c6a',
    messagingSenderId: '856313149919',
    projectId: 'recipe-bbf6d',
    storageBucket: 'recipe-bbf6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYj_wJzLFzQay1eWyFc4wKyassxKxdnXI',
    appId: '1:856313149919:ios:629b2bb5c51c6ae48a6c6a',
    messagingSenderId: '856313149919',
    projectId: 'recipe-bbf6d',
    storageBucket: 'recipe-bbf6d.appspot.com',
    androidClientId: '856313149919-4b4n9klqhqhr8evhtqr3mdl80f92efjn.apps.googleusercontent.com',
    iosClientId: '856313149919-dtjv8n72ns1r8340bgnaoqjg0tokjj3l.apps.googleusercontent.com',
    iosBundleId: 'com.example.myrecipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYj_wJzLFzQay1eWyFc4wKyassxKxdnXI',
    appId: '1:856313149919:ios:9eb1bbae15a001758a6c6a',
    messagingSenderId: '856313149919',
    projectId: 'recipe-bbf6d',
    storageBucket: 'recipe-bbf6d.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbdGdsgrLwU5YUIopw_DG0vQHGCHw1Adk',
    appId: '1:856313149919:web:eb2322329a4d7e6b8a6c6a',
    messagingSenderId: '856313149919',
    projectId: 'recipe-bbf6d',
    authDomain: 'recipe-bbf6d.firebaseapp.com',
    storageBucket: 'recipe-bbf6d.appspot.com',
    measurementId: 'G-K9LBPEX45L',
  );
}