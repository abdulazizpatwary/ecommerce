import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/common/ui/controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/favourite_custom_button.dart';
import 'package:ecommerce/features/product/ui/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecommerce/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce/features/common/ui/widgets/product_inc_dec_widget.dart';
import 'package:ecommerce/features/product/ui/widgets/size_picker_widget.dart';
import 'package:ecommerce/features/review/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;
  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToCartController _addToCartController = AddToCartController();
  RxInt price = 0.obs;
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Product Details',
        onTapBack: () {
          Navigator.pop(context);
        },
      ),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.isLoading) {
            return CenteredProgressIndicator();
          }
          if (controller.errorMsg != null) {
            return Center(child: Text(controller.errorMsg!));
          }
          price.value = _productDetailsController.productModel.currentPrice;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarouselSlider(
                        model: controller.productModel,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productModel.title,
                                        style: theme.titleMedium,
                                      ),
                                      _buildReviewSection(),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  width: 80,
                                  child: FittedBox(
                                    child: ProductIncDecWidget(
                                      onChange: (int count) {
                                        _productTotalPrice(count);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            _colorAndSizeSection(theme),
                            SizedBox(height: 16),
                            Text('Description', style: theme.titleMedium),
                            SizedBox(height: 8),
                            Text(
                              ''' ${controller.productModel.description}''',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(
                theme,
                controller.productModel.colors.isNotEmpty,
                controller.productModel.sizes.isNotEmpty,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _colorAndSizeSection(TextTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: theme.titleMedium),
        SizedBox(height: 8),
        ColorPickerWidget(
          colors: _productDetailsController.productModel.colors,
          onColorChange: (String? selectedColor) {
            _selectedColor = selectedColor;
          },
        ),
        SizedBox(height: 16),
        Text('Size', style: theme.titleMedium),
        SizedBox(height: 8),
        SizePickerWidget(
          sizes: _productDetailsController.productModel.sizes,
          onSizeChange: (String? selectedSize) {
            _selectedSize = selectedSize;
          },
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 18),
            SizedBox(width: 4),
            Text(
              _productDetailsController.productModel.rating,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ProductReviewScreen.name,arguments: widget.productId);
          },
          child: Text('Reviews'),
        ),
        FavouriteCustomButton(
          productId: widget.productId,
          icon: Icons.favorite_outline_outlined,
          onTap: () {
            Get.find<AddToWishListController>().addToWishList(widget.productId);
          },
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(
    TextTheme theme,
    bool isColourAvailable,
    bool isSizeAvailable,
  ) {
    return GetBuilder(
      init: _addToCartController,
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Price', style: theme.titleSmall),
                  Obx(() {
                    return Text(
                      '\$$price',
                      style: theme.titleMedium?.copyWith(
                        color: AppColors.themeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                width: 120,
                child: Visibility(
                  visible: controller.isLoading == false,
                  replacement: CenteredProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isColourAvailable && _selectedColor == null) {
                        snackBarMsg(
                          context: context,
                          msg: 'Select Color',
                          isError: true,
                        );
                        return;
                      }
                      if (isSizeAvailable && _selectedSize == null) {
                        snackBarMsg(
                          context: context,
                          msg: 'Select Size',
                          isError: true,
                        );
                        return;
                      }
                      if (Get.find<AuthController>().isValidUser() == false) {
                        Get.to(() => SignInScreen());
                        return;
                      }
                      bool isSuccess = await _addToCartController.addToCart(
                        _productDetailsController.productModel.id,
                      );
                      if (isSuccess) {
                        if (!mounted) return;
                        snackBarMsg(context: context, msg: 'Added to cart');
                      } else {
                        if (!mounted) return;
                        snackBarMsg(
                          context: context,
                          msg: controller.errorMsg!,
                          isError: true,
                        );
                      }
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _productTotalPrice(int count) {
    price.value = count * _productDetailsController.productModel.currentPrice;
  }
}
