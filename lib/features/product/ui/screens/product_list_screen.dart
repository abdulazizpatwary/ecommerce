import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/data/models/category_item_model.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:ecommerce/features/common/ui/controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/product_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryModel});

  final CategoryItemModel categoryModel;
  static const String name = '/product/product-list-screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController = ProductListController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListController.getProductList(widget.categoryModel.id);
    _scrollController.addListener(loadMore);
  }

  Future<void> loadMore() async {
    if (_scrollController.position.extentAfter < 300) {
      _productListController.getProductList(widget.categoryModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.categoryModel.title,
        onTapBack: () {
          Navigator.pop(context);
        },
      ),
      body: GetBuilder(
        init: _productListController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenteredProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return controller.onRefresh(widget.categoryModel.id);
                  },
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: controller.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (ctx, index) {
                      ProductModel model = controller.productList[index];
                      return FittedBox(
                        child: ProductItemWidget(
                          model: model,
                          icon: Icons.favorite_outline_outlined,
                          onTapFavourite: () {
                            Get.find<AddToWishListController>().addToWishList(
                              model.id,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: controller.isLoading,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
