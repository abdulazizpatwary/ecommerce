import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,

      initialRoute: '/',
      routes: {
        '/':(context)=>SplashScreen(),
      }
    );
  }
}
