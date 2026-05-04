import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce/features/wish/controller/remove_from_wishlist_controller.dart';
import 'package:ecommerce/features/wish/data/wish_list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final RemoveFromWishlistController _removeFromWishlistController =
      Get.find<RemoveFromWishlistController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        _canPop();
      },
      child: Scaffold(
        appBar: AppBarWidget(title: 'Wish List', onTapBack: _canPop),
        body: GetBuilder<WishListController>(
          builder: (controller) {
            if (controller.isLoading) {
              return CenteredProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: controller.wishList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (ctx, index) {
                  WishListItemModel wishListItemModel =
                      controller.wishList[index];
                  return FittedBox(
                    child: ProductItemWidget(
                      model: wishListItemModel.productModel,
                      icon: Icons.delete,
                      onTapFavourite: () {
                        _removeFromWishlistController.deleteFromWishList(
                          wishListItemModel.id,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _canPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
