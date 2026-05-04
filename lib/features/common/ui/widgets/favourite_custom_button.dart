import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteCustomButton extends StatefulWidget {
  const FavouriteCustomButton({
    super.key,
    required this.productId,
    required this.icon, required this.onTap,
  });

  final String productId;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<FavouriteCustomButton> createState() => _FavouriteCustomButtonState();
}


class _FavouriteCustomButtonState extends State<FavouriteCustomButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
      builder: (controller) {
        bool isFavourite = controller.wishList.any(
              (e) => e.productModel.id == widget.productId,
        );

        return GestureDetector(
          onTap: widget.onTap,
          child: Card(
            color: isFavourite?Colors.pinkAccent:AppColors.themeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
            ),

            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(widget.icon, color: Colors.white, size: 16),
            ),
          ),
        );
      }
    );
  }
}
