import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDxjWDk3PUTYTYdspuYkvoSb1w2uDGVtpI',
        appId: '1:512635519443:android:1eb3f938f7a1880fc5ef26',
        messagingSenderId: '512635519443',
        projectId: 'ulearning-app-81179',
      ),
    );
    storageService = await StorageService().init();
  }
}