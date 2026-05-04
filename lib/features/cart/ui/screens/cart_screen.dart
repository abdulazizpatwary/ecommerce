import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:ecommerce/features/cart/ui/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/ui/screens/payment.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _cartListController.getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        _canPop();
      },
      child: Scaffold(
        appBar: AppBarWidget(title: 'Cart List', onTapBack: _canPop),
        body: GetBuilder<CartListController>(
          builder: (controller) {
            if(controller.isLoading){
              return CenteredProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItemList.length,
                    itemBuilder: (ctx, index) {
                      CartItemModel model = controller.cartItemList[index];
                      return CartItem(cartItemModel: model);
                    },
                  ),
                ),
                _buildTotalPriceAndCheckoutSection(theme),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTotalPriceAndCheckoutSection(TextTheme theme) {
    return GetBuilder<CartListController>(
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
                  Text('Total Price', style: theme.titleSmall),
                  Text(
                    '\$${controller.totalPrice}',
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.themeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Payment(controller.totalPrice.toDouble()));
                  },
                  child: Text('CheckOut'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _canPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
