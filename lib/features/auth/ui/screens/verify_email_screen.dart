import 'dart:async';

import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/app/app_constat.dart';
import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:ecommerce/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/verify_email_otp_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  static const String name = '/verify-email-screen';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  RxBool isResendEnable=AppConstat.initialButtonEnable.obs;
  final PinInputController _pinInputController = PinInputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxInt timeCount=AppConstat.initialResendTime.obs;
  late Timer timer;

  final VerifyEmailOtpController _verifyEmailOtpController =Get.find<VerifyEmailOtpController>();
  void resendTimerCount (){
    timeCount.value=AppConstat.initialResendTime;
    timer=Timer.periodic(Duration(seconds: 1), (timer){
      if(timeCount.value==0){
        timer.cancel();
        isResendEnable.value=true;
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
    resendTimerCount();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
              GetBuilder<VerifyEmailOtpController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return CenteredProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: onTapVerify,
                    child: Text(context.localization.verify),
                  );
                }
              ),
              SizedBox(height: 16),
              _resendCodeInTimeSection(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialPinFieldSection() {
    return Form(
      key: _formKey,
      child: MaterialPinFormField(
        pinController: _pinInputController,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        length: 4,
        validator: (String? value){
          RegExp regExp = RegExp(r'^[0-9]{1,45}$');
          if(!regExp.hasMatch(_pinInputController.text)&&_pinInputController.text.length!=4){
            _pinInputController.triggerError();
            _pinInputController.clearError();
            return "Enter Valid pin";
          }
          return null;

        },

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
      ),
    );
  }

  Widget _resendCodeInTimeSection() {
    return Column(
      children: [
        Obx(() {
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
        ),
        Obx(
                () {
              return TextButton(
                  onPressed:!isResendEnable.value?null: (){
                    resendTimerCount();
                  }, child: Text('Resend Code',style: TextStyle(
                  color:timeCount.value!=0? Colors.grey:AppColors.themeColor,
                  fontSize: 18,fontWeight: FontWeight.w500),));
            }
        ),
      ],
    );
  }

  void onTapVerify() async{
    if(_formKey.currentState!.validate()){
      VerifyOtpRequestModel model = VerifyOtpRequestModel(email: widget.email, otp: _pinInputController.text.trim());
      bool isSuccess = await _verifyEmailOtpController.verifyEmail(model);
      if(isSuccess){
        if(!mounted)return;
        snackBarMsg(context: context, msg: "SuccessFull",isError: false);
        Navigator.pushReplacementNamed(context, SignInScreen.name);
      }else{
        if(!mounted)return;
        snackBarMsg(context: context, msg: _verifyEmailOtpController.errorMsg!,isError: true);
      }

    }
  }
  @override
  void dispose() {
    super.dispose();
    _pinInputController.dispose();
    timer.cancel();
  }
}
