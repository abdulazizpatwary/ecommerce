import 'package:ecommerce/core/extensions/localizations_extension.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/review/ui/controllers/create_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});
  final String productId;

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
  final CreateReviewController _createReviewController = Get.find<CreateReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Create Review', onTapBack: (){
        Navigator.pop(context,true);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 48),
              _userCreateReviewSection(),
              SizedBox(height: 16),
              GetBuilder<CreateReviewController>(
                builder: (controller) {
                  if(controller.isLoading){
                    return CenteredProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      _onTapSubmitReview();
                    },
                    child: Text('Submit'),
                  );
                }
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSubmitReview() async {
    Map<String,dynamic> body={
      "product": widget.productId,
      "comment":_writeReviewTEController.text.trim(),
      "rating":"4"
    };
    bool isSuccess= await _createReviewController.createReview(body);
    if(isSuccess){
      if(!mounted)return;
      snackBarMsg(context: context, msg: 'Review Added');
    }
    else{
      if(!mounted)return;
      snackBarMsg(context: context, msg: _createReviewController.errorMsg!);
    }

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
