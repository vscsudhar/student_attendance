import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workspace/init_app.dart';

import 'core/app/app.router.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    await initApp();
    runApp(const MyApp());
  }, (Object error, StackTrace stackTrace) {
    //CrashReporting.reportCrash(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance',
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

