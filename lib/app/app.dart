import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/themes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance =  MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
