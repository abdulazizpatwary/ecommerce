import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writeReviewTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Create Review', onTapBack: (){
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 48),
              _userCreateReviewSection(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                  _onTapSubmitReview();
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  void _onTapSubmitReview() {
  }

  Widget _userCreateReviewSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
            controller:_writeReviewTEController ,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Write Reviews',
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

    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _writeReviewTEController.dispose();

  }


}
