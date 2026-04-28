import 'package:ecommerce/app/app_routes.dart';
import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/app/controller_binders.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialBinding: ControllerBinders(),
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      locale: Locale('en'),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateAppRoutes,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('bn'), // Bengali
      ],
    );
  }
}
