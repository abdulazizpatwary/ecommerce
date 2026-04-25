import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Text(context.localization.welcomeBack, style: theme.titleLarge),
                SizedBox(height: 8),
                Text(
                  context.localization.pleaseEnterEmail,
                  style: theme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                _userSignInputSection(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(context.localization.signIn),
                ),
                SizedBox(height: 16),
                _onTapSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userSignInputSection() {
    return Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                ],
              );
  }

  Widget _onTapSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an Account? ",
        style: TextStyle(
          color: Colors.black45,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "Sign Up",
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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
