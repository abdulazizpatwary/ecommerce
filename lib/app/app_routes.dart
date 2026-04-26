import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? appOnRoutes(RouteSettings setting){
    late Widget route;
    if(setting.name == SplashScreen.name){
      route = SplashScreen();
    }
    else if(setting.name == SignInScreen.name){
      route = SignInScreen();
    }
    else if(setting.name == SignUpScreen.name){
      route = SignUpScreen();
    }
    else if(setting.name == VerifyEmailScreen.name){
      route = VerifyEmailScreen();
    }
    else if(setting.name == MainBottomNavScreen.name){
      route = MainBottomNavScreen();
    }
    return MaterialPageRoute(builder: (context)=>route);
  }
}