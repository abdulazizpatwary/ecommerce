import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class HomeSctionHeader extends StatelessWidget {
  const HomeSctionHeader({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: onTap,
          child: Text('See All', style: TextStyle(color: AppColors.themeColor)),
        ),
      ],
    );
  }
}