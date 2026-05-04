import 'package:ecommerce/app/app_config.dart';
import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name='/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen()async{
    await Future.delayed(Duration(seconds: 4));
     Get.find<AuthController>().isUserLoggedIn();
    if(!mounted)return;

    Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate)=>false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 8,),
              Text('${context.localization.version}: ${AppConfig.appVersion}'),
              SizedBox(height: 8,),

            ],
          ),
        ),
      ),
    );
  }
}


