import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/review/data/review_item_model.dart';
import 'package:ecommerce/features/review/ui/controllers/review_list_controller.dart';
import 'package:ecommerce/features/review/ui/screens/create_review_screen.dart';
import 'package:ecommerce/features/review/ui/widgets/review_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productId});
  static const String name='product/review';
  final String productId;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  final ReviewListController _reviewListController = Get.find<ReviewListController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _reviewListController.getReviewList(widget.productId);
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Reviews', onTapBack: (){
        Navigator.pop(context);
      }),
      body: GetBuilder<ReviewListController>(


        builder: (controller) {
          if(controller.isInitialLoading){
            return CenteredProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: controller.reviewList.length,
                      itemBuilder: (ctx,index){
                      ReviewItemModel model = controller.reviewList[index];
                    return ReviewCardItem(model: model,);
                  }),
                ),
              ),
              _reateRiviewSection(theme, context),


            ],
          );
        }
      ),
    );
  }

  Widget _reateRiviewSection(TextTheme theme, BuildContext context) {
    return GetBuilder<ReviewListController>(
      builder: (controller) {
        return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.themeColor.withValues(alpha: 0.12)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reviews (${controller.totalReview??0})',style: theme.titleMedium?.copyWith(color: Colors.grey.shade800),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, CreateReviewScreen.name,arguments: widget.productId);
                  },
                  child: Container(

                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      shape: BoxShape.circle

                    ),
                    child: Icon(Icons.add,color: Colors.white,),),
                )
              ],
            ),);
      }
    );
  }
}


