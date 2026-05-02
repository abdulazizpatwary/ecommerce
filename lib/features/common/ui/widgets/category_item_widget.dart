import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/category/data/models/category_item_model.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});
  final CategoryItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name,arguments: model.title);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.themeColor.withValues(alpha: 0.12),
            ),

            child:Image.network(model.icon,width: 40,height: 40,color: AppColors.themeColor,errorBuilder: (_,_,_){
              return Icon(Icons.broken_image,size: 40,color: AppColors.themeColor,);
            },),

          ),
          SizedBox(height: 4,),
          Text(model.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.themeColor),),

        ],
      ),
    );
  }
}