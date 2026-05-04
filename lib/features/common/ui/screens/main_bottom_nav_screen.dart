import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce/features/common/data/models/enum_tag.dart';
import 'package:ecommerce/features/common/ui/controllers/category_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/home_slider_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/wish_list_controller.dart';
import 'package:ecommerce/features/home/ui/controllers/product_list_by_tag_controller.dart';
import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce/features/wish/ui/screens/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {


  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishList(),
  ];
  final MainBottomNavController _mainBottomNavController =
      Get.find<MainBottomNavController>();
  final HomeSliderController _sliderController = Get.find<HomeSliderController>();
  final CategoryController _categoryController = Get.find<CategoryController>();
  final WishListController _wishListController = Get.find<WishListController>();
  final ProductListByTagController _productListByTagController =Get.find<ProductListByTagController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _sliderController.getSliderList();
      _categoryController.getCategoryList();
      _productListByTagController.getProductListByTag(ProductListTag.newProducts);
      _productListByTagController.getProductListByTag(ProductListTag.popularProduct);
      _productListByTagController.getProductListByTag(ProductListTag.specialProducts);
      _wishListController.getWishList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: (int index){
              if(controller.shouldNavigate(index)){
                controller.changeIndex(index);
              }else{
                Get.to(()=>SignInScreen());
              }
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'WishList',
              ),
            ],
          ),
        );
      },
    );
  }
}
