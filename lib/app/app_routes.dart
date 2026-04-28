import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateAppRoutes(RouteSettings setting){
    late Widget route;
    if(setting.name==SplashScreen.name){
      route=const SplashScreen();
    }
    else if(setting.name==SignInScreen.name){
      route=const SignInScreen();
    }
    else if(setting.name==SignUpScreen.name){
      route=const SignUpScreen();
    }
    else if(setting.name==VerifyEmailScreen.name){

      route=VerifyEmailScreen();
    }
    else if(setting.name==MainBottomNavScreen.name){
      route=const MainBottomNavScreen();
    }
    else if(setting.name==ProductListScreen.name){
      String categoryName= setting.arguments as String;
      route= ProductListScreen(categoryName: categoryName,);
    }
    return MaterialPageRoute(builder: (context)=>route);
  }
}