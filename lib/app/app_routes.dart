import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecommerce/features/common/data/models/category_item_model.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_screen.dart';
import 'package:ecommerce/features/review/ui/screens/create_review_screen.dart';
import 'package:ecommerce/features/review/ui/screens/product_review_screen.dart';
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
      String email = setting.arguments as String;

      route=VerifyEmailScreen(email: email,);
    }
    else if(setting.name==MainBottomNavScreen.name){
      route=const MainBottomNavScreen();
    }
    else if(setting.name==ProductListScreen.name){
      CategoryItemModel categoryItemModel= setting.arguments as CategoryItemModel;
      route= ProductListScreen(categoryModel: categoryItemModel,);
    }
    else if(setting.name==ProductDetailsScreen.name){
      int productId= setting.arguments as int;
      route= ProductDetailsScreen(productId: productId,);
    }
    else if(setting.name==ProductReviewScreen.name){
      route= ProductReviewScreen();
    }
    else if(setting.name==CreateReviewScreen.name){
      route= CreateReviewScreen();
    }
    return MaterialPageRoute(builder: (context)=>route);
  }
}