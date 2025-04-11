import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flowery_store/core/services/firebase_notification/local_notification_service.dart';
import 'package:flowery_store/core/services/firebase_notification/notification_helper.dart';
import 'package:flowery_store/core/services/shared_preference/shared_preference_helper.dart';
import 'package:flowery_store/flowery_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/utils/abb_bloc_observer.dart';
import 'di/di.dart';
import 'firebase_options.dart';

import 'dart:async'; // Import Completer


// ✅ Completer to track initialization state
 final Completer<bool> appInitialized = Completer<bool>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefHelper().instantiatePreferences();
  Bloc.observer = MyBlocObserver();

  await dotenv.load(fileName: '.env.firebase');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .whenComplete(() async {
   await NotificationHelper().initialize();
    await LocalNotificationService.setupLocalNotifications();


  });

  configureDependencies();

  // ✅ Mark initialization as complete
  appInitialized.complete(true);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(FloweryStore());
}

