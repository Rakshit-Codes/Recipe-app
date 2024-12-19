import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myrecipe_app/app.dart';
import 'package:myrecipe_app/firebase_options.dart';


void main() async {

  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Failed to initialize Firebase: $e');
    // Handle the initialization error gracefully, if needed
  }

  await GetStorage.init();

  runApp(
    const App(),
  );
}
