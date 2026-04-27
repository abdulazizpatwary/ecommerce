import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.themeColor.withValues(alpha: 0.12),
          ),
          child: Icon(Icons.computer, size: 40, color: AppColors.themeColor),
        ),
        SizedBox(height: 4,),
        Text('Computer',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.themeColor),)
        
      ],
    );
  }
}