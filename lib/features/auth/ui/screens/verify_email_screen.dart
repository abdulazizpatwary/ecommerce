import 'dart:async';

import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  static const String name = '/verify-email-screen';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final PinInputController _pinInputController = PinInputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxInt timeCount=30.obs;
  Future<void> timeCounter ()async{
    timeCount.value=120;
    Timer.periodic(Duration(seconds: 1), (timer){
      if(timeCount.value==0){
        timer.cancel();
      }else{
        timeCount.value=timeCount.value-1;
      }
    });
    return;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeCounter();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                AppLogo(),
                SizedBox(height: 16),
                Text(
                  context.localization.enterOTPCode,
                  style: theme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  context.localization.aFourDigitCodeHasBeenSent,
                  style: theme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                _buildMaterialPinFieldSection(),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    RegExp regExp = RegExp(r'^[0-9]{1,45}$');
                    if(regExp.hasMatch(_pinInputController.text)&&_pinInputController.text.length==4){
                      onTapVerify();

                    }
                    else{
                      _pinInputController.triggerError();
                      _pinInputController.clearError();
                    }
                  },
                  child: Text(context.localization.verify),
                ),
                SizedBox(height: 16),
                _onTapSignUpSection(),
                Obx(
                 () {
                    return TextButton(onPressed: (){
                      timeCounter();
                    }, child: Text('Resend Code',style: TextStyle(
                      color:timeCount.value!=0? Colors.grey:AppColors.themeColor,
                        fontSize: 18,fontWeight: FontWeight.w500),));
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialPinFieldSection() {
    return MaterialPinField(
      pinController: _pinInputController,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      //enabled: true,
      mainAxisSize: MainAxisSize.max,
      length: 4,

      onCompleted: (pin) {},
      onChanged: (value) {},
      theme: MaterialPinTheme(
        spacing: 8,
        fillColor: Colors.white,
        entryAnimation: MaterialPinAnimation.fade,
        completeFillColor: Colors.white,
        filledFillColor: Colors.white,
        focusedFillColor: Colors.white,
        borderColor: AppColors.themeColor,
        borderWidth: 2,
        filledBorderColor: AppColors.themeColor,
        focusedBorderColor: AppColors.themeColor,
        completeBorderColor: AppColors.themeColor,

        shape: MaterialPinShape.outlined,
        cellSize: Size(56, 56),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _onTapSignUpSection() {
    return Obx(() {
        return RichText(
          text: TextSpan(
            text: "This Code Will Expire in  ",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: "$timeCount",
                style: TextStyle(color: AppColors.themeColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignUpScreen.name);
                  },
              ),

            ],
          ),
        );
      }
    );
  }

  void onTapVerify() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pinInputController.dispose();
  }
}
