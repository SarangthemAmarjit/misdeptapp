import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/routes/app_routes.dart';
import 'config/theme.dart';
// Ensure AppTheme is defined and exported in config/theme.dart
import 'routes/app_pages.dart';
import 'routes/app_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Flutter Web',
      theme: AppTheme.lightTheme, // Defined in config/theme.dart
      initialRoute: AppRoutes.home,
      initialBinding: AppBindings(),
      getPages: AppPages.pages,
    );
  }
}
