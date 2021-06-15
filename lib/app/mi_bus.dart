import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/app/route_generator.dart';
import 'package:myriad_bus_scheduler/app/routes.dart';
import 'package:myriad_bus_scheduler/ui/screens/splash/splash_screen.dart';
import 'package:myriad_bus_scheduler/util/styles/theme.dart';

class MiBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();

    return MaterialApp(
      theme: AppTheme.main(),
      onGenerateRoute: AppRoutes.generateRoute,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: _firebaseAnalytics)
      ],
      home: SplashScreen(),
    );
  }
}
