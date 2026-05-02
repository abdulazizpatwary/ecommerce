import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 48),
              AppLogo(width: 100,height: 100,),
              SizedBox(height: 16),
              Text(
                context.localization.registerYourAccount,
                style: theme.titleLarge,
              ),
              SizedBox(height: 8),
              Text(
                context.localization.getStartedWithUsWithYourDetails,
                style: theme.bodyLarge!.copyWith(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              _userSignUpInputSection(),
              SizedBox(height: 16),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return CenteredProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed:  _onTapSignUp,
                    child: Text(context.localization.signUp),
                  );
                }
              ),
              SizedBox(height: 16),
              _onTapSignInSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() async{
    if (_formKey.currentState!.validate()) {
      SignUpRequestModel model = SignUpRequestModel(firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text,
          phone: _phoneTEController.text.trim(),
          deliveryAddress: _deliveryAddressTEController.text.trim());
      bool isSuccess =await _signUpController.signUp(model: model);
      if(isSuccess){
        if(!mounted)return;
        snackBarMsg(context: context, msg: "Successfully SignUp");
        Navigator.pushNamed(context, VerifyEmailScreen.name,arguments: model.email);
      }else{
        if(!mounted)return;
        snackBarMsg(context: context, msg: _signUpController.errorMsg!);
      }
    }

  }

  Widget _userSignUpInputSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            decoration: InputDecoration(
              hintText: context.localization.emailHint,
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localization.enterEmail;
              }
              String email = value!;
              if (!EmailValidator.validate(email)) {
                return context.localization.enterValidEmail;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            decoration: InputDecoration(
              hintText: context.localization.firstName,
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localization.enterFirstName;
              }

              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            decoration: InputDecoration(
              hintText: context.localization.lastName,
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localization.enterLastName;
              }

              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _phoneTEController,
            decoration: InputDecoration(hintText: context.localization.phone),
            validator: (value) {
              String phone = value ?? '';
              RegExp regexp = RegExp(
                r'(^([+]{1}[8]{2}|0088)?(01){1}[3-9]{1}\d{8})$',
              );
              if (!regexp.hasMatch(phone)) {
                return context.localization.enterPhone;
              }

              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              hintText: context.localization.passwordHint,
            ),
            validator: (value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return context.localization.enterValidPass;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: context.localization.deliveryAddress,
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localization.enterDeliveryAddress;
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAddressTEController.dispose();
  }

  Widget _onTapSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Have an Account? ",
        style: TextStyle(
          color: Colors.black45,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
