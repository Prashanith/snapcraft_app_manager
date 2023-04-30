import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_ui/navigation/route_generator.dart';
import 'package:snap_ui/navigation/routes.dart';
import 'package:snap_ui/services/service_initializer.dart';

void main() {
  ServiceInitializer.initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snap Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(useMaterial3: true),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.dashboard,
    );
  }
}
