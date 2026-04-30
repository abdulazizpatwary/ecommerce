import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/cart/ui/widgets/cart_item.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        _canPop();
      },
      child: Scaffold(
        appBar: AppBarWidget(title: 'Cart', onTapBack: _canPop),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (ctx,index){
                return CartItem();
              }),
            ),
            _buildTotalPriceAndCheckoutSection(theme),

          ],
        ),
      ),
    );
  }
  Widget _buildTotalPriceAndCheckoutSection(TextTheme theme) {
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
              Text(
                '\$100',
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
            child: ElevatedButton(onPressed: () {}, child: Text('CheckOut')),
          ),
        ],
      ),
    );
  }
  void _canPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}

