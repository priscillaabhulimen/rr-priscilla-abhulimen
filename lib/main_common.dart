import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rr_priscilla_abhulimen/rr_app.dart';

import 'app/locator.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await ConfigReader.initialize();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await DotEnv.load();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await setUpLocator();

    /*if (environ == Environment.dev) {
      Config.isProd = false;
    } else {
      Config.isProd = true;
    }*/

    runApp(RedAndRedApp());
  }, (exception, stackTrace) async {
    // await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}