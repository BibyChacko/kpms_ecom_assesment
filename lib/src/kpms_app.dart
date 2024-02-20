import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/bindings/app_bindings.dart';
import 'core/constants/strings.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';
import 'features/authentication/presentation/view/pages/login_page.dart';

class KpmsApp extends StatelessWidget {
  const KpmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          primarySwatch: Colors.orange,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
            background: Colors.white,
          ),
          textTheme: TextTheme(
            bodyMedium: AppTextTheme.bodyStyle,
          ),
          buttonTheme: const ButtonThemeData(
              minWidth: 160, buttonColor: AppTheme.primaryColor)),
      home: const LoginPage(),
    );
  }
}
