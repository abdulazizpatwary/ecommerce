import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        _canPop();
      },
      child: Scaffold(
        appBar: AppBarWidget(title: 'Wish List', onTapBack: _canPop),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              childAspectRatio: 0.8,mainAxisSpacing: 4,crossAxisSpacing: 2), itemBuilder: (ctx,index){
            //return FittedBox(child: ProductItemWidget());
          }),
        )
        
      ),
      
    );
  }
  void _canPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}
