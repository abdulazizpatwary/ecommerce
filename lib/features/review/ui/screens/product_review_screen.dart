import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/review/ui/screens/create_review_screen.dart';
import 'package:ecommerce/features/review/ui/widgets/review_card_item.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});
  static const String name='product/review';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Reviews', onTapBack: (){
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (ctx,index){
                return ReviewCardItem();
              }),
            ),
          ),
          _reateRiviewSection(theme, context)

        ],
      ),
    );
  }

  Container _reateRiviewSection(TextTheme theme, BuildContext context) {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.themeColor.withValues(alpha: 0.12)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews (100)',style: theme.titleMedium?.copyWith(color: Colors.grey.shade800),),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, CreateReviewScreen.name);
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
}


