import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/init_app.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';
import 'package:workspace/ui/shared/styles.dart';

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
    return SessionTimeoutManager(
      sessionConfig: locator<UserAuthenticationService>().sessionConfig,
      child: MaterialApp(
        title: 'Student Attendance',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: appcolor2699FB,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
