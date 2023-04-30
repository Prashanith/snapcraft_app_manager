import 'package:flutter/material.dart';
import 'package:snap_ui/navigation/routes.dart';
import 'package:snap_ui/screens/dashboard/dashboard.dart';
import 'package:snap_ui/screens/splash_screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
